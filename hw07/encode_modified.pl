encode_modified(Xs,EMXs) :-  /* Xs = Input List, EMXs = Xs encoded */
   pack(Xs,PXs),             /* Pack Xs -> return PXs              */
   encode_packed(PXs,EMXs).  /* Call helper to count & compress    */

/* Helper Function encode_packed                                  */
/* Takes in a packed list, appends count & compresses inner-lists */

encode_packed([],[]).                        /* Base Case: Empty list  */

encode_packed([[X|Xs]|PXs],[[N,X]|EMXs]) :-  /* Rec Case1: inner N > 1 */
    countX(N,X,[X|Xs]),
    N > 1,
    encode_packed(PXs,EMXs).                 /* Encode with N          */

encode_packed([[X]|PXs],[X|EMXs]) :-         /* Rec Case2: inner N = 1 */
    countX(N,X,[X]),
    N = 1,
    encode_packed(PXs,EMXs).                 /* Encode without N       */



/* Pack from the previous problem */

pack([],[[]]).

pack([X],[[X]]).

pack([X,X|Xs],[[X|NXs]|CLs]) :-
    pack([X|Xs],[NXs|CLs]).

pack([X,Y|Xs],[[X]|CLs]) :-
    X \= Y,
    pack([Y|Xs],CLs).


/* Helper Function countX                  */
/* Counts how many X exist in a given list */

countX(0,_,[]).         /* Base Case: 0 elements in Empty list  */

countX(N,X,[X|Xs]) :-   /* Rec Case1: X is head, N++, recur     */
    countX(Incr,X,Xs),
    N is Incr + 1.

countX(N,X,[Y|Xs]) :-   /* Rec Case2: Y is head, Y \= X, recur  */
    X \= Y,
    countX(N,X,Xs).















