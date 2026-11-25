/* ==========================================================
   EXPERIMENT 9 : Vowel Counting   (Q56)
   ----------------------------------------------------------
   AIM   : To count the number of vowels in the sentence
           "This is my first Degree in Saveetha School of Engineering."

   LOGIC : 1. Convert the sentence into a list of characters
              (atom_chars/2).
           2. Walk through the list:
                - if the first character is a vowel, add 1;
                - otherwise just continue with the rest.
           3. Empty list -> count is 0 (base case).
           Vowels: a e i o u (both small and capital letters).
   ========================================================== */

% ---------- FACTS ----------
vowel(a). vowel(e). vowel(i). vowel(o). vowel(u).
vowel('A'). vowel('E'). vowel('I'). vowel('O'). vowel('U').

sentence('This is my first Degree in Saveetha School of Engineering.').

% ---------- RULES ----------
% count_vowels(CharList, Count)
count_vowels([], 0).
count_vowels([Char|Rest], Count) :-
    count_vowels(Rest, RestCount),
    (   vowel(Char)
    ->  Count is RestCount + 1
    ;   Count = RestCount
    ).

% vowel_count(Sentence, Count): Sentence is an atom.
vowel_count(Sentence, Count) :-
    atom_chars(Sentence, Chars),
    count_vowels(Chars, Count).

% run: count the vowels of the given sentence and display the total.
run :-
    sentence(S),
    vowel_count(S, N),
    format('Sentence : ~w~n', [S]),
    format('Total number of vowels = ~w~n', [N]).

% run_input: same, but the sentence is typed by the user.
% Type the sentence inside single quotes and end it with a full stop.
run_input :-
    write('Enter a sentence in single quotes, ending with a full stop: '),
    read(S),
    vowel_count(S, N),
    format('Total number of vowels = ~w~n', [N]).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 09_vowel_counting.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- run.
   Sentence : This is my first Degree in Saveetha School of Engineering.
   Total number of vowels = 19
   true.

   ?- vowel_count('hello world', N).
   N = 3.

   PROGRAM WITH USER INPUT  (input is typed by the user)

   ?- run_input.
   Enter a sentence in single quotes, ending with a full stop: 'I love Prolog programming.'.
   Total number of vowels = 8
   true.

   (The text 'I love Prolog programming.'. above is typed by the user.)

   VOWELS WORD BY WORD : This(1) is(1) my(0) first(1) Degree(3) in(1)
   Saveetha(4) School(2) of(1) Engineering(5)  = 19

   RESULT : The sentence contains 19 vowels. Experiment executed successfully.
   ========================================================== */
