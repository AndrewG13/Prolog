/* Subterm from the lecture */

subterm(Term,Term).

subterm(Sub,Term) :-
compound(Term), Term =.. [F|Args], subterm_list(Sub,Args).

subterm_list(Sub,[Arg|Args]) :-
subterm(Sub,Arg).

subterm_list(Sub,[Arg|Args]) :-
subterm_list(Sub,Args).


/* occurrences(Sub,Term,N) Predicate                                    */
/*                                                                      */
/* I noticed that when running subterm(), tabbing would show more       */
/* results past the first encounter. I was having trouble keeping track.*/
/* Prolog provides a resource to that counts the number of successful   */          /* counts the number of successful goals of a recursive predicate!      */

occurrences(Sub,Term,N) :-
aggregate_all(count, subterm(Sub,Term), N).
