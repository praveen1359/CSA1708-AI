/* ==========================================================
   EXPERIMENT 3 : Bird Flying Problem   (Q41)
   ----------------------------------------------------------
   AIM   : To demonstrate the use of the CUT (!) operator and
           FAIL in Prolog using the bird-flying problem.

   LOGIC : Normally every bird can fly:   fly(X) :- bird(X).
           But a penguin cannot fly, so the FIRST clause is
               fly(penguin) :- !, fail.
           - ! (cut)  : once Prolog enters this clause it can NOT
                        go back and try the next fly/1 clause.
           - fail     : forces the goal to be false.
           Together (!, fail) mean "definitely NOT true".
           Clause ORDER matters: the penguin clause must be first.
   ========================================================== */

% ---------- FACTS ----------
bird(eagle).
bird(sparrow).
bird(penguin).

% ---------- RULES ----------
fly(penguin) :- !, fail.     % penguin never flies (cut + fail)
fly(X) :- bird(X).           % every other bird flies

/* ==========================================================
   HOW TO RUN :  swipl -q -s 03_bird_flying.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- fly(eagle).
   true.

   ?- fly(sparrow).
   true.

   ?- fly(penguin).         % cut + fail -> definitely false
   false.

   ?- fly(dog).             % dog is not a bird
   false.

   ?- fly(X).
   false.

   Why does  fly(X)  give false?  X is unbound, so it matches the FIRST
   clause  fly(penguin) :- !, fail.  with X = penguin. The cut removes the
   other clause and fail makes the goal false, so Prolog does not even
   try  fly(X) :- bird(X).  This clearly shows the effect of the cut.

   RESULT : Cut (!) and fail were demonstrated: eagle and sparrow can fly,
            penguin cannot. Experiment executed successfully.
   ========================================================== */
