pack([],[[]]).    /* Base Case1: Empty lists are packed               */

pack([X],[[X]]).  /* Base Case2: X is only element, pack by itself    */

pack([X,X|Xs],[[X|NXs]|CLs]) :-  /* Rec Case1: X next to X            */
    pack([X|Xs],[NXs|CLs]).      /* Add to packed list, recur on next */

pack([X,Y|Xs],[[X]|CLs]) :-      /* Rec Case2: X next to Y, X \= Y    */
    X \= Y,
    pack([Y|Xs],CLs).            /* Recur on Y, no "packing" done     */
