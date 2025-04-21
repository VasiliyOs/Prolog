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


remove_elements_with_digit_sum(ListIn, DigitSumTarget, ListOut) :-
   exclude(has_digit_sum(DigitSumTarget), ListIn, ListOut).

has_digit_sum(TargetSum, Number) :-
   sum_digits_up(Number, Sum),
   Sum =:= TargetSum.

min_digit(N, Min) :-
    min_digit_down(N, Min).

min_digit_down(N, Min) :-
    N < 10,
    Min is N.
min_digit_down(N, Min) :-
    N >= 10,
    Digit is N mod 10,
    NextN is N // 10,
    min_digit_down(NextN, RestMin),
    Min is min(Digit, RestMin).


min_digit(N, Min) :-
    min_digit_up(N, 9, Min).

min_digit_up(0, CurrentMin, CurrentMin).
min_digit_up(N, CurrentMin, Min) :-
    N > 0,
    Digit is N mod 10,
    NewMin is min(Digit, CurrentMin),
    NextN is N // 10,
    min_digit_up(NextN, NewMin, Min).

count_less_than_3(N, Count) :-
    count_less_than_3_down(N, Count).

count_less_than_3_down(0, 0).
count_less_than_3_down(N, Count) :-
    N > 0,
    Digit is N mod 10,
    NextN is N // 10,
    count_less_than_3_down(NextN, RestCount),
    (Digit < 3 -> Count is RestCount + 1; Count is RestCount).


count_less_than_3(N, Count) :-
    count_less_than_3_up(N, 0, Count).

count_less_than_3_up(0, Count, Count).
count_less_than_3_up(N, Acc, Count) :-
    N > 0,
    Digit is N mod 10,
    (Digit < 3 -> NewAcc is Acc + 1; NewAcc is Acc),
    NextN is N // 10,
    count_less_than_3_up(NextN, NewAcc, Count).



min_max_positions(List, MinPos, MaxPos) :-
    min_list(List, Min),
    max_list(List, Max),
    nth0(MinPos, List, Min),
    nth0(MaxPos, List, Max).

reverse_between(List, MinPos, MaxPos, Result) :-
    (MinPos < MaxPos ->
        Start is MinPos + 1,
        End is MaxPos - 1
    ;
        Start is MaxPos + 1,
        End is MinPos - 1
    ),
    length(List, Length),
    (Start >= 0, End < Length, Start =< End ->
        split_list(List, Start, End, Prefix, Middle, Suffix),
        reverse(Middle, ReversedMiddle),
        append(Prefix, ReversedMiddle, Temp),
        append(Temp, Suffix, Result)
    ;
        Result = List
    ).

split_list(List, Start, End, Prefix, Middle, Suffix) :-
    length(Prefix, Start),
    append(Prefix, Rest, List),
    MiddleLength is End - Start + 1,
    length(Middle, MiddleLength),
    append(Middle, Suffix, Rest).

main12 :-
    read_list(List),
    min_max_positions(List, MinPos, MaxPos),
    reverse_between(List, MinPos, MaxPos, Result),
    print_list(Result).




two_max(List, First, Second) :-
    sort(List, Sorted),        
    reverse(Sorted, [First, Second|_]).

main24 :-
    read_list(List),
    (length(List, L), L >= 2 ->
        two_max(List, First, Second),
        write('Первый наибольший: '), write(First), nl,
        write('Второй наибольший: '), write(Second), nl
    ;
        write('Список слишком короткий'), nl
    ).



max_odd(List, MaxOdd) :-
    include(odd, List, OddList),
    (OddList = [] ->
        MaxOdd = none
    ;
        max_list(OddList, MaxOdd)
    ).

odd(X) :-
    1 is X mod 2.

main36 :-
    read_list(List),
    max_odd(List, MaxOdd),
    (MaxOdd \= none ->
        write('Максимальный нечетный элемент: '), write(MaxOdd), nl
    ;
        write('Нет нечетных элементов'), nl
    ).




is_prime(2).
is_prime(3).
is_prime(P) :-
    integer(P),
    P > 3,
    P mod 2 =\= 0,
    \+ has_factor(P, 3).

has_factor(N, K) :-
    K < N, 
    (N mod K =:= 0 ; K2 is K + 2, has_factor(N, K2)).

gcd(0, B, B).
gcd(A, B, G) :-
    A > 0,
    R is B mod A,
    gcd(R, A, G).

are_coprime(A, B) :-
    gcd(A, B, 1).

number_digits(Number, Digits) :-
    number_chars(Number, Chars),
    maplist(char_number, Chars, Digits).

char_number(Char, Number) :-
    char_code(Char, Code),
    Number is Code - 48.

sum_list([], 0).
sum_list([H|T], Sum) :-
    sum_list(T, SumT),
    Sum is H + SumT.

read_input(Number) :-
    write('Введите натуральное число: '),
    read(Number).






sum_nonprime_divisors(Number, Sum) :-
    findall(D, (
        between(2, Number, D),
        Number mod D =:= 0,
        \+ is_prime(D)
    ), Divisors),
    sum_list(Divisors, Sum).

print_sum_nonprime_divisors(Sum) :-
    format('1. Сумма непростых делителей: ~w~n', [Sum]).





sum_prime_digits(Number, Sum) :-
    number_digits(Number, Digits),
    include(is_prime, Digits, PrimeDigits),
    sum_list(PrimeDigits, Sum).

count_special_numbers(Number, Count) :-
    sum_prime_digits(Number, SumPD),
    Upper is Number - 1,
    findall(X, (
        between(2, Upper, X),
        Number mod X =\= 0,
        gcd(Number, X) =\= 1,
        are_coprime(X, SumPD)
    ), Numbers),
    length(Numbers, Count).

print_special_numbers_count(Count) :-
    format('2. Количество чисел по условию: ~w~n', [Count]).

main5 :-
    read_input(Number),
    sum_nonprime_divisors(Number, Sum1),
    print_sum_nonprime_divisors(Sum1),
    count_special_numbers(Number, Count2),
    print_special_numbers_count(Count2).
