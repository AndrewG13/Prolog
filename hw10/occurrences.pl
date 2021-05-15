/* Subterm from the lecture */

subterm(Term,Term).

subterm(Sub,Term) :-
compound(Term), Term =.. [F|Args], subterm_list(Sub,Args).

subterm_list(Sub,[Arg|Args]) :-
subterm(Sub,Arg).

subterm_list(Sub,[Arg|Args]) :-
subterm_list(Sub,Args).

/*  Here is what I was attempting to do

subuniv(Sub,Term,N) :-
compound(Term), Term =.. [F|Args], countSub(Sub,[F|Args],N).

countSub(Sub,[],0).

countSub(Sub,[Sub|Args],N) :-
countSub(Sub,Args,N1),
N is N1 + 1.

countSub(Sub,[F|Args],N) :-
Sub \= F,
countSub(Sub,Args,N).

*/


/* occurrences(Sub,Term,N) Predicate                                    */
/*                                                                      */
/* I noticed that when running subterm(), tabbing would show more       */
/* results past the first encounter. I was having trouble keeping track.*/
/* Prolog provides a resource to that counts the number of successful   */          /* counts the number of successful goals of a recursive predicate!      */

occurrences(Sub,Term,N) :-
subuniv(Sub,Term,N).



