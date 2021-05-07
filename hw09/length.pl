/* Iterative Length Predicate */
/* Logic:                     */
/* Keep track of OX (Original List), Xs (dup OX), Length (which starts at 0), */
/* While Xs !empty, increment Length, move on to next element in Xs           */
/* Predicate terminates when Xs is empty (Length will be == L)                */

itlength([],0).

itlength(Xs,L) :-
    itL(Xs,Xs,0,L).

itL(OXs,[_|Xs],Length,L) :-   /* OXs refers to Original List */
    NewLength is Length + 1,
    itL(OXs,Xs,NewLength,L).

itL(Xs,[],L,L).
