/* ==========================================================
   EXPERIMENT 10 : Student Database   (Q59)
   ----------------------------------------------------------
   AIM   : To create a student database and write rules to find
           (a) the students of a particular department and
           (b) the students above a given age.

   LOGIC : student(Name, Department, Age) is a fact.
           in_department(Dept, Name) picks students of Dept.
           above_age(Limit, Name, Age) picks students whose Age
           is greater than Limit (using the comparison  >  ).
   ========================================================== */

% ---------- FACTS ----------
% student(Name, Department, Age).
student(arun,   cse, 21).
student(bala,   it,  22).
student(chitra, cse, 20).
student(divya,  ece, 21).

% ---------- RULES ----------
% Students belonging to a particular department.
in_department(Dept, Name) :-
    student(Name, Dept, _).

% Students whose age is above the given limit.
above_age(Limit, Name, Age) :-
    student(Name, _, Age),
    Age > Limit.

/* ==========================================================
   HOW TO RUN :  swipl -q -s 10_student_database.pl

   SAMPLE QUERIES AND EXPECTED OUTPUT

   % (a) Students of a department
   ?- in_department(cse, N).
   N = arun ;
   N = chitra.

   ?- in_department(ece, N).
   N = divya.

   % (b) Students above a given age
   ?- above_age(20, N, A).
   N = arun,
   A = 21 ;
   N = bala,
   A = 22 ;
   N = divya,
   A = 21.

   ?- above_age(21, N, A).
   N = bala,
   A = 22 ;
   false.

   ?- above_age(25, N, A).
   false.

   RESULT : Students were retrieved by department and by age limit.
            Experiment executed successfully.
   ========================================================== */
