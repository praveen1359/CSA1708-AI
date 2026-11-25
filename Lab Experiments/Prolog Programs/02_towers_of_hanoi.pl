/* ==========================================================
   EXPERIMENT 2 : Towers of Hanoi   (Q40)
   ----------------------------------------------------------
   AIM   : To solve the Towers of Hanoi problem for N disks
           using three rods A, B and C and display the moves.

   LOGIC : To move N disks from Source to Destination using
           an Auxiliary rod:
             1. Move the top N-1 disks  Source -> Auxiliary
             2. Move the biggest disk   Source -> Destination
             3. Move the N-1 disks      Auxiliary -> Destination
           Step 1 and 3 are the same problem with N-1 disks,
           so the rule calls itself (recursion).
           Base case: 0 disks -> nothing to do.
           Number of moves for N disks = 2^N - 1.
   ========================================================== */

% hanoi(N) : solve for N disks, move from rod A to rod C using B.
hanoi(N) :-
    move(N, 'A', 'C', 'B').

% move(N, Source, Destination, Auxiliary)
move(0, _, _, _) :- !.                 % base case: no disks
move(N, Source, Destination, Auxiliary) :-
    N > 0,
    N1 is N - 1,
    move(N1, Source, Auxiliary, Destination),
    format('Move disk ~w from ~w to ~w~n', [N, Source, Destination]),
    move(N1, Auxiliary, Destination, Source).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 02_towers_of_hanoi.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- hanoi(1).
   Move disk 1 from A to C
   true.

   ?- hanoi(2).
   Move disk 1 from A to B
   Move disk 2 from A to C
   Move disk 1 from B to C
   true.

   ?- hanoi(3).
   Move disk 1 from A to C
   Move disk 2 from A to B
   Move disk 1 from C to B
   Move disk 3 from A to C
   Move disk 1 from B to A
   Move disk 2 from B to C
   Move disk 1 from A to C
   true.

   (3 disks need 2^3 - 1 = 7 moves.)

   RESULT : The program displays the correct sequence of moves for N disks.
            Experiment executed successfully.
   ========================================================== */
