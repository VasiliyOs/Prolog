max(X, Y, U, Z) :-
  max(X, Y, Temp),  
     max(Temp, U, Z).  


max(A, B, A) :- A >= B.
max(A, B, B) :- A < B.


fact_down(0, 1).
fact_down(N, X) :- 
    N > 0,
    N1 is N - 1,
    fact_down(N1, X1),
    X is N * X1.



fact_up(N, X) :- 
    fact_up(N, 1, X).

fact_up(0, Acc, Acc). 
fact_up(N, Acc, X) :- 
    N > 0,
    N1 is N - 1,
    Acc1 is Acc * N,
    fact_up(N1, Acc1, X).


sum_digits_down(0, 0).
sum_digits_down(N, Sum) :- 
    N > 0,
    Digit is N mod 10,
    N1 is N // 10,
    sum_digits(N1, Sum1),
    Sum is Sum1 + Digit.

read_list(List) :-
    write('Введите список чисел: '),
    read(List).



print_list([]).
print_list([H|T]) :-
    write(H), nl,
    print_list(T).


sum_digits_up(N, Sum) :- 
    sum_digits_upr(N, Sum).

sum_digits_up(0, 0).
sum_digits_up(N, Sum) :- 
    N > 0,
    Digit is N mod 10,
    N1 is N // 10,
    sum_digits_up(N1, Sum1),
    Sum is Sum1 + Digit.

is_square_free(0).
is_square_free(Num) :-
    Num > 0,
    \+ (between(2, sqrt(Num), I), Square is I * I, Num mod Square =:= 0).


sum_list_down([], 0).
sum_list_down([H|T], Summ) :- 
    sum_list_down(T, SummTail),
    Summ is H + SummTail.



sum_list_up(List, Summ) :- 
   sum_list_up_helper(List, Summ).

sum_list_up([], 0).
sum_list_up([H|T], Summ) :- 
   sum_list_up(T, SummTail),
   Summ is H + SummTail.
