/* ==========================================================
   EXPERIMENT 13 : Forward Chaining - Ravi   (Q66)
   ----------------------------------------------------------
   AIM   : To prove by FORWARD CHAINING that Ravi passes the
           examination.

   KNOWLEDGE BASE (in English)
     Rule 1 : If a person studies, the person gains knowledge.
     Rule 2 : If a person gains knowledge, the person passes the exam.
     Fact   : Ravi studies.

   LOGIC : Start from the fact  studies(ravi).
           Rule 1 fires  -> new fact gains_knowledge(ravi).
           Rule 2 fires  -> new fact passes_exam(ravi).
           No more rules can fire, so the goal passes_exam(ravi) is proved.
   ========================================================== */

:- dynamic known/1.

% ---------- INITIAL FACT ----------
known(studies(ravi)).

% ---------- RULES : rule(Conclusion, ListOfConditions) ----------
rule(gains_knowledge(P), [studies(P)]).
rule(passes_exam(P),     [gains_knowledge(P)]).

% ---------- FORWARD CHAINING ENGINE ----------
forward :-
    rule(Conclusion, Conditions),
    all_known(Conditions),
    \+ known(Conclusion),                 % conclusion must be NEW
    !,
    assertz(known(Conclusion)),
    format('Derived new fact: ~w~n', [Conclusion]),
    forward.
forward.

all_known([]).
all_known([Condition|Rest]) :-
    known(Condition),
    all_known(Rest).

% run: forward chain and test the goal.
run :-
    forward,
    (   known(passes_exam(ravi))
    ->  writeln('Conclusion: Ravi passes the examination.')
    ;   writeln('Conclusion: Ravi is NOT proved to pass.')
    ).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 13_ravi_forward_chaining.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- run.
   Derived new fact: gains_knowledge(ravi)
   Derived new fact: passes_exam(ravi)
   Conclusion: Ravi passes the examination.
   true.

   RESULT : studies(ravi) -> gains_knowledge(ravi) -> passes_exam(ravi).
            Hence RAVI PASSES THE EXAMINATION.
   ========================================================== */
