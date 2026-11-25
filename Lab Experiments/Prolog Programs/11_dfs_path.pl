/* ==========================================================
   EXPERIMENT 11 : Depth-First Search with Backtracking   (Q60)
   ----------------------------------------------------------
   AIM   : To implement Depth-First Search to find a path between
           a source city and a destination city and display it.

   MAP (roads can be travelled in both directions):

        chennai --- bangalore --- mumbai --- delhi
            \                       |          |
             +----- hyderabad ------+          |
                         \                     |
                          +------- nagpur ------+

   LOGIC : Start from the source city. Go to a neighbouring city that
           is NOT already visited (to avoid loops) and keep going deeper.
           If we reach a dead end, Prolog BACKTRACKS and tries the next
           neighbour. When the destination is reached, the visited list
           (reversed) is the path.
   ========================================================== */

% ---------- FACTS : connected(CityA, CityB) ----------
connected(chennai,   bangalore).
connected(chennai,   hyderabad).
connected(bangalore, mumbai).
connected(hyderabad, mumbai).
connected(hyderabad, nagpur).
connected(mumbai,    delhi).
connected(nagpur,    delhi).

% road/2 : a road works in both directions.
road(X, Y) :- connected(X, Y).
road(X, Y) :- connected(Y, X).

% ---------- DEPTH FIRST SEARCH ----------
% dfs(Current, Destination, VisitedSoFar, FinalVisitedList)
dfs(Destination, Destination, Visited, Visited).
dfs(Current, Destination, Visited, Path) :-
    road(Current, Next),
    \+ member(Next, Visited),                 % do not visit a city twice
    dfs(Next, Destination, [Next|Visited], Path).

% find_path(Source, Destination, Path)
find_path(Source, Destination, Path) :-
    dfs(Source, Destination, [Source], ReversedPath),
    reverse(ReversedPath, Path).

% show_path(Source, Destination): prints the first path found.
show_path(Source, Destination) :-
    find_path(Source, Destination, Path),
    !,                                        % stop at the first path
    atomic_list_concat(Path, ' -> ', Text),
    format('Path: ~w~n', [Text]).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 11_dfs_path.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- show_path(chennai, delhi).
   Path: chennai -> bangalore -> mumbai -> delhi
   true.

   ?- find_path(chennai, delhi, P).     % press ; to see other paths
   P = [chennai, bangalore, mumbai, delhi] ;
   P = [chennai, bangalore, mumbai, hyderabad, nagpur, delhi] ;
   P = [chennai, hyderabad, mumbai, delhi] ;
   P = [chennai, hyderabad, nagpur, delhi] ;
   false.

   ?- find_path(delhi, chennai, P).
   P = [delhi, mumbai, bangalore, chennai] ;
   P = [delhi, mumbai, hyderabad, chennai] ;   % (more paths follow with ;)
   ...

   RESULT : Depth-first search found the path from Chennai to Delhi (the
            first path found goes deep along bangalore -> mumbai -> delhi).
            Experiment executed successfully.
   ========================================================== */
