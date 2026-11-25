/* ==========================================================
   EXPERIMENT 1 : Student, Teacher and Sub-Code   (Q39)
   ----------------------------------------------------------
   AIM   : To write a Prolog program that finds the professor
           who teaches the course (sub-code) a student studies.

   LOGIC : A student studies a course (sub-code).
           A professor teaches a course (sub-code).
           So Professor is the teacher of a Student if both
           are linked by the SAME sub-code:
               professor(S, P) :- studies(S, C), teaches(P, C).
   ========================================================== */

% ---------- FACTS ----------
% studies(Student, SubCode).
studies(charlie, csc135).
studies(olivia,  csc135).
studies(jack,    csc131).
studies(arthur,  csc134).

% teaches(Professor, SubCode).
teaches(kirke,   csc135).
teaches(collins, csc131).
teaches(collins, csc171).
teaches(juniper, csc134).

% ---------- RULE ----------
% Professor teaches the course that Student studies.
professor(Student, Professor) :-
    studies(Student, SubCode),
    teaches(Professor, SubCode).

/* ==========================================================
   HOW TO RUN :  swipl -q -s 01_student_teacher.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   ?- professor(charlie, X).
   X = kirke.

   ?- professor(jack, X).
   X = collins.

   ?- professor(arthur, X).
   X = juniper.

   ?- professor(X, kirke).          % who studies under kirke?
   X = charlie ;                    % <- press the semicolon ( ; ) key
   X = olivia ;                     % <- press ; again
   false.

   ?- professor(arthur, collins).   % yes/no question
   false.

   RESULT : The program correctly finds the professor of every student by
            matching the common sub-code. Experiment executed successfully.
   ========================================================== */
