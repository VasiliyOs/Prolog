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
