/* ==========================================================
   EXPERIMENT 7 : Planets Database   (Q48)
   ----------------------------------------------------------
   AIM   : To create a planets database and write queries to find
           the planets orbiting the sun, the objects orbiting the
           earth and the objects orbiting mars.

   LOGIC : orbits(Object, Body) means Object moves around Body.
           A query with a variable (e.g. orbits(P, sun)) asks Prolog
           to find every P that makes the fact true.
           Press ; to get the next answer.
   ========================================================== */

% ---------- FACTS ----------
% orbits(Object, Body).
orbits(mercury, sun).
orbits(venus,   sun).
orbits(earth,   sun).
orbits(mars,    sun).
orbits(moon,    earth).
orbits(phobos,  mars).
orbits(deimos,  mars).

% ---------- OPTIONAL HELPER RULES (same queries, readable names) ----------
planet(P)        :- orbits(P, sun).        % planets orbit the sun
orbits_earth(X)  :- orbits(X, earth).
orbits_mars(X)   :- orbits(X, mars).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 07_planets_database.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   % 1. Planets orbiting the sun  (press ; for the next answer)
   ?- orbits(P, sun).
   P = mercury ;
   P = venus ;
   P = earth ;
   P = mars.

   % 2. Objects orbiting the earth
   ?- orbits(X, earth).
   X = moon.

   % 3. Objects orbiting mars
   ?- orbits(X, mars).
   X = phobos ;
   X = deimos.

   % Using the helper rules (same results)
   ?- planet(P).
   P = mercury ;
   P = venus ;
   P = earth ;
   P = mars.

   RESULT : Planets of the sun (4), moon of earth (1) and satellites of
            mars (2) were found. Experiment executed successfully.
   ========================================================== */
