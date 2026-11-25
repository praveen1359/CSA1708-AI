/* ==========================================================
   EXPERIMENT 12 : Animal Classification   (Q65)
   ----------------------------------------------------------
   AIM   : To classify animals as Mammal, Bird, Reptile or
           Aquatic animal using facts and rules.

   SAMPLE DATASET (animals and their features)
     dog       - gives milk
     whale     - gives milk, lives in water
     eagle     - has feathers, lays eggs, breathes air
     snake     - has scales, lays eggs, breathes air
     crocodile - has scales, lays eggs, breathes air, lives in water
     shark     - has scales, lays eggs, lives in water (breathes with gills)

   LOGIC : Mammal  : gives milk.
           Bird    : has feathers and lays eggs.
           Reptile : has scales, lays eggs and breathes air.
           Aquatic : lives in water.
           An animal may belong to more than one class
           (whale = mammal + aquatic, crocodile = reptile + aquatic).
   ========================================================== */

% ---------- FACTS (features of animals) ----------
gives_milk(dog).
gives_milk(whale).

has_feathers(eagle).

has_scales(snake).
has_scales(crocodile).
has_scales(shark).

lays_eggs(eagle).
lays_eggs(snake).
lays_eggs(crocodile).
lays_eggs(shark).

breathes_air(eagle).
breathes_air(snake).
breathes_air(crocodile).

lives_in_water(whale).
lives_in_water(crocodile).
lives_in_water(shark).

animal(dog).
animal(whale).
animal(eagle).
animal(snake).
animal(crocodile).
animal(shark).

% ---------- CLASSIFICATION RULES ----------
mammal(X)  :- gives_milk(X).
bird(X)    :- has_feathers(X), lays_eggs(X).
reptile(X) :- has_scales(X), lays_eggs(X), breathes_air(X).
aquatic(X) :- lives_in_water(X).

% classify(Animal, Class): Class is one class of the animal.
classify(Animal, mammal)   :- mammal(Animal).
classify(Animal, bird)     :- bird(Animal).
classify(Animal, reptile)  :- reptile(Animal).
classify(Animal, aquatic_animal) :- aquatic(Animal).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 12_animal_classification.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- classify(dog, C).
   C = mammal ;
   false.

   ?- classify(whale, C).          % whale is both mammal and aquatic
   C = mammal ;
   C = aquatic_animal.

   ?- classify(eagle, C).
   C = bird ;
   false.

   ?- classify(snake, C).
   C = reptile ;
   false.

   ?- classify(crocodile, C).      % reptile and aquatic
   C = reptile ;
   C = aquatic_animal.

   ?- classify(shark, C).
   C = aquatic_animal.

   ?- mammal(X).
   X = dog ;
   X = whale.

   ?- reptile(X).
   X = snake ;
   X = crocodile ;
   false.

   ?- bird(X).
   X = eagle.

   ?- aquatic(X).
   X = whale ;
   X = crocodile ;
   X = shark.

   RESULT : Animals were classified as mammal, bird, reptile or aquatic
            animal. Experiment executed successfully.
   ========================================================== */
