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
