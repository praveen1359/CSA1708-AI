/* ==========================================================
   EXPERIMENT 5 : Monkey and Banana Problem   (Q43)
   ----------------------------------------------------------
   AIM   : To find a sequence of actions by which a monkey can
           get the bananas using a chair and a stick.

   PROBLEM : A room has four places: door, window, corner, middle.
             - Bananas hang from the ceiling in the MIDDLE of the room.
             - Monkey is at the DOOR.
             - Chair is at the WINDOW.
             - Stick is in the CORNER.
             The monkey can only grab the bananas when it stands ON the
             chair, in the MIDDLE of the room, HOLDING the stick.

   STATE   : state(MonkeyPlace, ChairPlace, Stick, OnChair, HasBanana)
             Stick    = at(Place)  or  held
             OnChair  = on  or  off
             HasBanana= yes or  no

   LOGIC   : move/3 describes every legal action (old state -> new state).
             solve/2 tries action lists of length 0,1,2,3 ... so the
             FIRST plan found is the SHORTEST one.
   ========================================================== */

location(door).
location(window).
location(corner).
location(middle).

% initial_state(State)
initial_state(state(door, window, at(corner), off, no)).

% ---------- ACTIONS : move(OldState, Action, NewState) ----------

% 1. Monkey walks from one place to another (only when NOT on the chair).
move(state(P1, Chair, Stick, off, no),
     walk(P1, P2),
     state(P2, Chair, Stick, off, no)) :-
    location(P2), P2 \= P1.

% 2. Monkey picks up the stick (it must be at the same place).
move(state(P, Chair, at(P), off, no),
     grab_stick,
     state(P, Chair, held, off, no)).

% 3. Monkey pushes the chair to another place (monkey and chair together).
move(state(P1, P1, Stick, off, no),
     push_chair(P1, P2),
     state(P2, P2, Stick, off, no)) :-
    location(P2), P2 \= P1.

% 4. Monkey climbs on the chair (it must be at the chair's place).
move(state(P, P, Stick, off, no),
     climb_chair,
     state(P, P, Stick, on, no)).

% 5. Monkey grabs the bananas (on chair, in the middle, holding the stick).
move(state(middle, middle, held, on, no),
     grab_bananas,
     state(middle, middle, held, on, yes)).

% ---------- SEARCH ----------
% solve(State, Plan): Plan is a list of actions leading to HasBanana = yes.
solve(state(_, _, _, _, yes), []).
solve(State, [Action|Rest]) :-
    move(State, Action, NextState),
    solve(NextState, Rest).

% plan(Plan): shortest plan from the initial state.
plan(Plan) :-
    initial_state(Start),
    length(Plan, _),            % tries lengths 0,1,2,... (shortest first)
    solve(Start, Plan),
    !.                          % stop at the first (shortest) plan

% show_plan: prints the plan one action per line.
show_plan :-
    plan(Plan),
    writeln('Plan for the monkey to get the bananas:'),
    print_steps(Plan, 1).

print_steps([], _).
print_steps([Action|Rest], N) :-
    format('Step ~w: ~w~n', [N, Action]),
    N1 is N + 1,
    print_steps(Rest, N1).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 05_monkey_banana.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- show_plan.
   Plan for the monkey to get the bananas:
   Step 1: walk(door,window)
   Step 2: push_chair(window,corner)
   Step 3: grab_stick
   Step 4: push_chair(corner,middle)
   Step 5: climb_chair
   Step 6: grab_bananas
   true.

   ?- plan(P).
   P = [walk(door, window), push_chair(window, corner), grab_stick,
        push_chair(corner, middle), climb_chair, grab_bananas].

   (SWI-Prolog prints the list on a single line in the terminal.)

   RESULT : The monkey obtains the bananas in 6 steps - the shortest valid
            plan. Experiment executed successfully.
   ========================================================== */
