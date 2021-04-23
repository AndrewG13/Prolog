dupli(Dummy,0,Dummy) :-   /* Catches bad 'N = 0' logic, returns input  */
    write("ERROR: N cannot be 0").

dupli([X],1,[X]).         /* Base Case: N = 1, no need to dup result   */

dupli([X],N,[X|Xs]) :-    /* Rec Case1: X is the only element left     */
    Decr_N is N - 1,      /* While N > 0, ensure X is head of Xs (dup) */
    Decr_N > 0,
    dupli([X],Decr_N,Xs). /* Decrement N, recur on Xs                  */

dupli([X|Xs],N,NLs) :-         /* Rec Case2: X is not only element  */
    dupli([X],N,Dup_X),        /* Dup X, store as Dup_X             */
    dupli(Xs,N,Dup_Xs),        /* recur dupli() on the rest of list */
    append(Dup_X,Dup_Xs,NLs).  /* Append results together           */
