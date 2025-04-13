man(anatoliy).
man(dimitriy).
man(vlad).
man(kirill).
man(mefodiy).

woman(vladina).
woman(galya).
woman(sveta).
woman(zoya).
woman(katrin).

dite(dimitriy, anatoliy).
dite(dimitriy, galya).
dite(vladina, anatoliy).
dite(vladina, galya).
dite(kirill, dimitriy).
dite(mefodiy, dimitriy).
dite(kirill, sveta).
dite(mefodiy, sveta).
dite(zoya, vlad).
dite(zoya, vladina).
dite(katrin, vlad).
dite(katrin, vladina).

men :-
    man(X),
    write(X), nl,
    fail.
men.

women :-
    woman(X),
    write(X), nl,
    fail.
women.

children(X) :-
    dite(Child, X),
    write(Child),
    nl,
    fail.
children(_).

mother(M, X) :- 
    woman(M),
    dite(X, M). 

mother(X) :-
    woman(M),
    dite(X, M),
    write(M), nl.

father(F, X) :- 
    man(F),
    dite(X, F). 

brother(X, Y) :-
    man(X),
    father(F, X),
    father(F, Y),
    mother(M, X),
    mother(M, Y),
    X \= Y.

brothers(X) :-
    brother(Brother, X),
    write(Brother), nl,
    fail.
brothers(_).

b_s(X, Y) :-
    father(F, X),
    father(F, Y),
    mother(M, X),
    mother(M, Y),
    X \= Y.

b_s(X) :-
    b_s(Bs, X),
    write(Bs), nl,
    fail.
b_s(_).
