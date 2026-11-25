/* ==========================================================
   EXPERIMENT 4 : Family Tree   (Q42)
   ----------------------------------------------------------
   AIM   : To implement a family tree for Pam, Liz, Ann, Pat,
           Tom, Bob and Jim and define the relations mother,
           father, grandfather, grandmother, sister, brother.

   NOTE  : The question bank does not give the relationships,
           so the following SAMPLE family is assumed:

                 Pam  ==  Tom
                      |
              +-------+-------+
              |               |
             Bob             Liz
              |
          +---+---+
          |       |
         Ann     Pat
                   |
                  Jim

           Pam & Tom are the parents of Bob.   Tom is also parent of Liz.
           Bob is the parent of Ann and Pat.   Pat is the parent of Jim.
           (Females: Pam, Liz, Ann, Pat   Males: Tom, Bob, Jim)
   ========================================================== */

% ---------- FACTS ----------
% parent(Parent, Child).
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).
female(liz).
female(ann).
female(pat).

male(tom).
male(bob).
male(jim).

% ---------- RULES ----------
% mother(M, C): M is the mother of C.
mother(M, C) :- parent(M, C), female(M).

% father(F, C): F is the father of C.
father(F, C) :- parent(F, C), male(F).

% grandfather(G, C): G is the father of a parent of C.
grandfather(G, C) :- father(G, P), parent(P, C).

% grandmother(G, C): G is the mother of a parent of C.
grandmother(G, C) :- mother(G, P), parent(P, C).

% sister(S, P): S is a female and has a common parent with P.
sister(S, P) :- parent(X, S), parent(X, P), female(S), S \= P.

% brother(B, P): B is a male and has a common parent with P.
brother(B, P) :- parent(X, B), parent(X, P), male(B), B \= P.

/* ==========================================================
   HOW TO RUN :  swipl -q -s 04_family_tree.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT
   (A final "false." after ; only means "no more answers".)

   ?- mother(M, bob).
   M = pam ;
   false.

   ?- father(F, bob).
   F = tom.

   ?- mother(X, jim).
   X = pat.

   ?- grandfather(G, ann).
   G = tom ;
   false.

   ?- grandmother(G, ann).
   G = pam ;
   false.

   ?- grandfather(G, jim).
   G = bob ;
   false.

   ?- grandmother(G, jim).
   false.

   ?- sister(S, bob).
   S = liz ;
   false.

   ?- sister(ann, pat).
   true.

   ?- brother(B, liz).
   B = bob ;
   false.

   ?- brother(bob, liz).
   true.

   ?- brother(B, pat).
   false.

   RESULT : All six relations were defined for the sample family and
            verified with queries. Experiment executed successfully.
   ========================================================== */
