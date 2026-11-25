/* ==========================================================
   EXPERIMENT 14 : Backward Chaining - Parrot   (Q68)
   ----------------------------------------------------------
   AIM   : To prove by BACKWARD CHAINING whether a parrot can fly.

   KNOWLEDGE BASE (in English)
     Rule : All birds can fly.        -> can_fly(X) :- bird(X).
     Fact : Parrot is a bird.         -> bird(parrot).
     Fact : Parrot is healthy.        -> healthy(parrot).

   LOGIC : Backward chaining is GOAL-DRIVEN. Prolog starts from the
           goal can_fly(parrot) and works backwards:
              can_fly(parrot)  is true if  bird(parrot)  is true.
              bird(parrot)     is a fact  -> TRUE.
           so can_fly(parrot) is proved. This is exactly how Prolog
           answers every query.
           (healthy(parrot) is just an extra fact; the rule
            "all birds can fly" does not need it.)
   ========================================================== */

% ---------- FACTS ----------
bird(parrot).
healthy(parrot).

% ---------- RULE ----------
can_fly(X) :- bird(X).         % all birds can fly

/* ==========================================================
   HOW TO RUN :  swipl -q -s 14_parrot_backward_chaining.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- can_fly(parrot).        % goal-driven proof
   true.

   ?- can_fly(X).             % who can fly?
   X = parrot.

   ?- can_fly(dog).           % dog is not known to be a bird
   false.

   ?- bird(parrot).
   true.

   ?- healthy(parrot).
   true.

   GOAL TREE :   can_fly(parrot)
                      |  (rule: can_fly(X) :- bird(X))
                 bird(parrot)  ---> fact ---> TRUE

   RESULT : The goal can_fly(parrot) is proved by backward chaining.
            Hence THE PARROT CAN FLY.
   ========================================================== */
