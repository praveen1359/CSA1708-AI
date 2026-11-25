/* ==========================================================
   EXPERIMENT 6 : Forward Chaining - Criminal Identification (Q44)
   ----------------------------------------------------------
   AIM   : To prove by FORWARD CHAINING that Robert is a criminal.

   KNOWLEDGE BASE (in English)
     1. It is a crime for an American to sell weapons to hostile nations.
     2. Country A is an enemy of America.
     3. Country A possesses missiles.
     4. All missiles were sold to Country A by Robert.
     5. Robert is an American citizen.
     (Extra common-sense rules: a missile is a weapon,
      an enemy of America is a hostile nation.)

   LOGIC : Forward chaining starts from the KNOWN FACTS and keeps
           applying rules to derive NEW facts until nothing new can be
           derived (data-driven reasoning).
           - known/1  : the facts known so far (dynamic, grows).
           - rule/2   : rule(Conclusion, [Conditions]).
           - forward/0: finds a rule whose conditions are all known and
                        whose conclusion is new, adds the conclusion,
                        and repeats.
   ========================================================== */

:- dynamic known/1.

% ---------- INITIAL FACTS ----------
known(american(robert)).
known(enemy(country_a, america)).
known(missile(m1)).               % Country A possesses a missile m1
known(owns(country_a, m1)).

% ---------- RULES : rule(Conclusion, ListOfConditions) ----------
rule(weapon(X),            [missile(X)]).                       % missile is a weapon
rule(hostile(N),           [enemy(N, america)]).                % enemy of America is hostile
rule(sells(robert, X, country_a), [missile(X), owns(country_a, X)]).  % Robert sold the missiles
rule(criminal(P),          [american(P), weapon(W), sells(P, W, N), hostile(N)]).

% ---------- FORWARD CHAINING ENGINE ----------
% forward: apply rules again and again until no new fact is found.
forward :-
    rule(Conclusion, Conditions),
    all_known(Conditions),
    \+ known(Conclusion),                 % conclusion must be NEW
    !,
    assertz(known(Conclusion)),
    format('Derived new fact: ~w~n', [Conclusion]),
    forward.
forward.                                   % no more rules can fire

% all_known(List): every condition in the list is a known fact.
all_known([]).
all_known([Condition|Rest]) :-
    known(Condition),
    all_known(Rest).

% run: start forward chaining and check the goal.
run :-
    forward,
    (   known(criminal(robert))
    ->  writeln('Conclusion: Robert is a criminal.')
    ;   writeln('Conclusion: Robert is NOT proved to be a criminal.')
    ).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 06_criminal_forward_chaining.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- run.
   Derived new fact: weapon(m1)
   Derived new fact: hostile(country_a)
   Derived new fact: sells(robert,m1,country_a)
   Derived new fact: criminal(robert)
   Conclusion: Robert is a criminal.
   true.

   ?- known(criminal(robert)).      % check the fact base after run
   true.

   NOTE : Run  ?- run.  only ONCE per session. (A second run derives
          nothing new and still reports the conclusion, because the
          derived facts are already stored.)

   RESULT : Starting from the given facts, forward chaining derived
            weapon(m1), hostile(country_a), sells(robert,m1,country_a)
            and finally criminal(robert). Hence ROBERT IS A CRIMINAL.
   ========================================================== */
