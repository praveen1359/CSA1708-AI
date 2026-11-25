/* ==========================================================
   EXPERIMENT 8 : Fruit Colour Prediction using Backtracking (Q50)
   ----------------------------------------------------------
   AIM   : To demonstrate BACKTRACKING by finding all the possible
           colours of apple and other fruits.

   LOGIC : colour(Fruit, Colour) has several clauses. When a query
           such as colour(apple, C) is asked, Prolog gives the first
           matching clause. When ; is pressed, it BACKTRACKS and tries
           the next matching clause, until all are exhausted.
           The last clause  colour(X, unknown)  matches ANY fruit, so
           every fruit finally gets the answer 'unknown' (default).
   ========================================================== */

% ---------- FACTS ----------
colour(cherry, red).
colour(banana, yellow).
colour(apple,  red).
colour(apple,  green).
colour(orange, orange).
colour(_, unknown).            % default for any fruit (same as colour(X, unknown))

% all_colours(Fruit, List): collects every colour using findall/3.
all_colours(Fruit, List) :-
    findall(Colour, colour(Fruit, Colour), List).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 08_fruit_colour_backtracking.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- colour(apple, C).
   C = red ;                 % <- press ;  (backtracking to next clause)
   C = green ;               % <- press ;
   C = unknown.

   ?- colour(banana, C).
   C = yellow ;
   C = unknown.

   ?- colour(mango, C).      % mango is not in the database
   C = unknown.

   ?- colour(X, red).        % which fruits are red?
   X = cherry ;
   X = apple.

   ?- all_colours(apple, L). % all answers collected in one list
   L = [red, green, unknown].

   ?- all_colours(cherry, L).
   L = [red, unknown].

   RESULT : Backtracking produced every possible colour of a fruit:
            apple = red, green (and the default 'unknown').
            Experiment executed successfully.
   ========================================================== */
