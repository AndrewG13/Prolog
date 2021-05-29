
/* For all instances of 'down' ( both in down() & apply(), )  */
/* the logic is swapped, to accommodate for moving the cursor */
/* down and for reaching the bottom of the file.              */

edit :- edit(file([ ],[ ])).

edit(File) :-
write_prompt, read(Command), edit(File,Command).

edit(File,exit) :- !.

edit(File ,Command) :-
apply(Command,File,Filel),!,edit(Filel).
edit(File, Command) :- writeln([Command,' is not applicable']),!,edit(File).

apply(up,file([X|Xs],Ys),file(Xs,[X|Ys])).

apply(up(N),file(Xs,Ys),file(Xsl,Ysl)) :-
N > O,up(N,Xs,Ys,Xsl,Ysl).

apply(down,file(Xs,[Y|Ys]),file([Y|Xs],Ys)).

apply(down(N),file(Xs,Ys),file(Xsl,Ysl)) :-
N < O, down(N,Xs,Ys,Xsl,Ysl).

apply(insert(Line),file(Xs,Ys),file(Xs,[Line|Ys])).

apply(delete,file(Xs,[Y|Ys]),file(Xs,Ys)).

apply(print,file([X|Xs],Ys),file([X|Xs],Ys)) :- write(X),nl.

apply(print(*),file(Xs,Ys),file(Xs,Ys)) :-
reverse(Xs,Xsl),write_file(Xsl),write_file(Ys).

up(N,[ ],Ys,[ ],Ys).

up(O,Xs,Ys,Xs,Ys).

up(N,[X|Xs] ,Ys,Xsl,Ysl) :-
N > O, Nl is N-1, up(Nl,Xs,[X|Ys],Xsl,Ysl).

down(O, [], Ys, [], Ys).

down(N,Xs,Ys,Xs,Ys).

down(N, Xs, [Y|Ys], Xsl, Ysl) :-
N < O, N1 is N+1, down(N1,[Y|Xs],Ys,Xsl,Ysl).

write_file([X|Xs]) :-
write(X), nl, write_file(Xs).

write_file([ ]).

write_prompt :- write('>>'), nl.









