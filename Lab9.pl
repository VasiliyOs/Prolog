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
