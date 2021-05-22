myquicksort([X|Xs],Ys) :-
    mypartition(Xs,X,Littles,Bigs),
    myquicksort(Littles,Ls),
    myquicksort(Bigs,Bs),
    append(Ls,[X|Bs],Ys).

myquicksort([],[]).

mypartition([X|Xs],Y,[X|Ls],Bs) :-
    X =< Y,
    !,
    mypartition(Xs,Y,Ls,Bs).

mypartition([X|Xs],Y,Ls,[X|Bs]) :-
    X > Y,
    !,
    mypartition(Xs,Y,Ls,Bs).

mypartition([],_,[],[]).
