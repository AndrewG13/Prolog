/* Position Predicate */
/* I could not get it to work :( */
/* My logic was to retain the arity to use as frontmost position,      */
/* And gradually decrease the back of the list the further recursed    */
/* Where the lower number (current position) would be kept in the back */

position(Term,Term,[]).

position(Sub,Term,N) :-
compound(Term), functor(Term, F, N), position(N,Sub,Term,N).

position(N,Sub,Term,P) :-
N > 1, N1 is N-1, position(N1,Sub,Term,P).

position(N,Sub,Term,P) :-
arg(N,Term,Arg), position(Sub,Arg,[N|P]).


