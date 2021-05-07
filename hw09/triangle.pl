/* Recursive Triangle Predicate */

triangle(0,0).

triangle(N,T) :-
    N > 0,
    N1 is N - 1,
    triangle(N1,TN),
    T is N + TN.

/* Iterative Triangle Predicate */
/* Logic:                       */
/* Keep track of Index (which starts at 0),                                   */
/* While Index <= N, increment Index, add Index to Var (our recursive answer) */
/* Predicate terminates when Index > N (Var will be == T)                     */

ittriangle(0,0).

ittriangle(N,T) :-
    itTri(N,0,0,T).

itTri(N,Index,Var,T) :-
    Index =< N,
    Incr is Index + 1,
    NewVar is Var + Incr,
    itTri(N,Incr,NewVar,T).

itTri(N,N,T,T).

