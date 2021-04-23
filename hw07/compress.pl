compress([],[]).              /* Base Case: Empty lists are compressed */
compress([X],[X]).            /* Base Case: 1 element lists are compressed */
compress([X,X|Xs],CLs) :-      /* If X == next, delete one & recur on X */
    compress([X|Xs],CLs).
compress([X,Y|Xs],[X|CLs]) :-  /* If X != next, recur on next & update CLs */
    X \= Y,
    compress([Y|Xs],CLs).


