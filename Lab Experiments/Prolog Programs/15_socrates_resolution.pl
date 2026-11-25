/* ==========================================================
   EXPERIMENT 15 : Resolution Refutation - Socrates   (Q70)
   ----------------------------------------------------------
   AIM   : To prove, using RESOLUTION, that Socrates is mortal.

   KNOWLEDGE BASE (English -> Logic -> Clause form)
     1. All humans are mortal.   : for all X: human(X) -> mortal(X)
                                   Clause C1 :  ~human(X) v mortal(X)
     2. Socrates is a human.     : Clause C2 :  human(socrates)
     Goal : mortal(socrates)
     Negated goal (assumed true to get a contradiction):
                                   Clause C3 :  ~mortal(socrates)

   RESOLUTION REFUTATION
     Step 1 : Resolve C3 with C1  (X = socrates)
                ~mortal(socrates)  and  ~human(socrates) v mortal(socrates)
                gives  C4 : ~human(socrates)
     Step 2 : Resolve C4 with C2
                ~human(socrates)  and  human(socrates)
                gives  the EMPTY CLAUSE [ ]  (a contradiction)
     The assumption ~mortal(socrates) is false, hence
     mortal(socrates) is TRUE.

   PROLOG : Prolog itself uses resolution. The rule
               mortal(X) :- human(X).
            is the clause  mortal(X) v ~human(X)  written as an
            implication. The query  ?- mortal(socrates).  starts with the
            negated goal and resolves until nothing is left.
   ========================================================== */

% ---------- FACT and RULE ----------
human(socrates).
mortal(X) :- human(X).

% ---------- DEMONSTRATION OF THE RESOLUTION STEPS ----------
% refute(Goal): resolves the goal step by step and prints each step.
refute(true) :-
    !,
    writeln('  Empty clause [ ] reached -> contradiction.').
refute(Goal) :-
    format('  Current goal  : <- ~w~n', [Goal]),
    clause(Goal, Body),                       % pick a matching clause
    format('  Resolved with : ~w :- ~w~n', [Goal, Body]),
    refute(Body).

% prove_mortal: refutation proof that Socrates is mortal.
prove_mortal :-
    writeln('Negated goal assumed : <- mortal(socrates)'),
    refute(mortal(socrates)),
    writeln('Hence mortal(socrates) is TRUE.').

/* ==========================================================
   HOW TO RUN :  swipl -q -s 15_socrates_resolution.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- mortal(socrates).
   true.

   ?- mortal(X).
   X = socrates.

   ?- prove_mortal.
   Negated goal assumed : <- mortal(socrates)
     Current goal  : <- mortal(socrates)
     Resolved with : mortal(socrates) :- human(socrates)
     Current goal  : <- human(socrates)
     Resolved with : human(socrates) :- true
     Empty clause [ ] reached -> contradiction.
   Hence mortal(socrates) is TRUE.
   true.

   RESULT : Resolution of the negated goal with the rule and the fact
            produced the empty clause, so SOCRATES IS MORTAL.
   ========================================================== */
