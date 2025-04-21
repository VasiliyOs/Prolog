solution :-
    %  [Позиция, Имя, Национальность, Спорт]
    Friends = [Friend1, Friend2, Friend3],
    
    member([1, _, _, _], Friends), % Первое место
    member([2, _, _, _], Friends), % Второе место
    member([3, _, _, _], Friends), % Третье место
    
    member([_, michael, _, _], Friends),
    member([_, simon, _, _], Friends),
    member([_, richard, _, _], Friends),
    
    member([_, _, usa, _], Friends),
    member([_, _, israel, _], Friends),
    member([_, _, australia, _], Friends),
    
    member([_, _, _, basketball], Friends),
    member([_, _, _, tennis], Friends),
    member([_, _, _, cricket], Friends),
    
    member([1, _, _, cricket], Friends),
    
    member([_, michael, _, basketball], Friends),
    
    member([PosMichael, michael, _, basketball], Friends),
    member([PosAmerican, _, usa, _], Friends),
    PosMichael < PosAmerican,
    
    member([_, simon, israel, _], Friends),
    
    member([PosSimon, simon, israel, _], Friends),
    member([PosTennis, _, _, tennis], Friends),
    PosSimon < PosTennis,
    
    member([_, Australian, australia, _], Friends),
    
    member([_, richard, _, RichardSport], Friends),
    
    format('Australian: ~w~n', [Australian]),
    format('Richard sport: ~w~n', [RichardSport]).
    