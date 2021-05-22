mysubstitute(Old,New,Old,New).

mysubstitute(Old,_,Term,Term) :-
    atom(Term), Term \= Old.

mysubstitute(Old,New,Term,Term1) :-
    compound(Term),
    functor(Term,F,N),
    functor(Term1,F,N),!,
    mysubstitute(N,Old,New,Term,Term1).

mysubstitute(N,Old,New,Term,Term1) :-
    N > 0,
    arg(N,Term,Arg),
    mysubstitute(Old,New,Arg,Arg1),!,
    arg(N,Term1,Arg1),
    N1 is N-1,!,
    mysubstitute(N1,Old,New,Term,Term1).

mysubstitute(0,_,_,_,_).

/* Original Substitute */


osubstitute(Old,New,Old,New).

osubstitute(Old,_,Term,Term) :-
    atom(Term), Term \= Old.

osubstitute(Old,New,Term,Term1) :-
    compound(Term),
    functor(Term,F,N),
    functor(Term1,F,N),
    osubstitute(N,Old,New,Term,Term1).

osubstitute(N,Old,New,Term,Term1) :-
    N > 0,
    arg(N,Term,Arg),
    osubstitute(Old,New,Arg,Arg1),
    arg(N,Term1,Arg1),
    N1 is N-1,
    osubstitute(N1,Old,New,Term,Term1).

osubstitute(0,_,_,_,_).


