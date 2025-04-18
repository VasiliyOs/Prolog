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

daughter(X, Y) :-
    woman(X),
    (father(Y, X); mother(Y, X)).

daughter(X) :-
    woman(Daughter),
    (father(X, Daughter); mother(X, Daughter)),
    write(Daughter), nl,
    fail.
daughter(_).

husband(X, Y) :-
    man(X),
    woman(Y),
    dite(Child, X),
    dite(Child, Y),
    X \= Y.

husband(X) :-
    woman(X),
    man(Husband),
    dite(Child, X),
    dite(Child, Husband),
    write(Husband), nl.

grand_da1(X, Y) :-  
    woman(X),  
    dite(X, Parent),  
    dite(Parent, Y).  

grand_da2(X, Y) :-  
    daughter(X, Parent),  
    dite(Parent, Y). 

grand_ma_and_da1(X, Y) :-
    woman(X),
    woman(Y),
    (dite(X, Parent), dite(Parent, Y);
    dite(Y, Parent),  dite(Parent, X)).

grand_ma_and_da2(X, Y) :-
    woman(X),
    woman(Y),
    (grand_da1(X, Y); grand_da1(Y, X)).

sister(X, Y) :-
    woman(X),
    father(F, X),
    father(F, Y),
    mother(M, X),
    mother(M, Y),
    X \= Y.

niece(X, Y) :-
    woman(X),
    dite(X, Parent),
    (brother(Parent, Y); sister(Parent, Y)).

nieces(X) :-
    niece(Niece, X),
    write(Niece), nl,
    fail.
nieces(_).
