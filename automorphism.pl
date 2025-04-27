edge(1, 2).
edge(2, 3).
edge(3, 4).
edge(4, 1).

vertices(Vertices) :-
    findall(X, (edge(X, _); edge(_, X)), AllEdges),
    sort(AllEdges, Vertices).

permutation([], []).
permutation(List, [H|Perm]) :-
    select(H, List, Rest),
    permutation(Rest, Perm).

is_automorphism(Vertices, Permutation) :-
    permutation(Vertices, Permutation),
    forall(edge(X, Y), (
        nth1(PosX, Vertices, X), nth1(PosX, Permutation, PX),
        nth1(PosY, Vertices, Y), nth1(PosY, Permutation, PY),
        edge(PX, PY)
    )).

all_automorphisms(Aut) :-
    vertices(Vertices),
    is_automorphism(Vertices, Aut).
