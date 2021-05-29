
/* Logic: Prompt for a filename, carry it throughout the program */
/* just in case there would be logging.                          */
/* This required reworking the other predicates.                 */

log :-
shell_prompt_file,shell_read_file(FileName),start_shell(log,FileName).

start_shell(Flag,FileName) :-
shell_prompt,shell_read(Goal,Flag,FileName),shell(Goal,Flag,FileName).

shell(exit,Flag,FileName) :-
close_logging_file(FileName).

shell(nolog,Flag,FileName) :-
start_shell(nolog,FileName).

shell(log,Flag,FileName) :-
start_shell(log,FileName).

shell(Goal,Flag,FileName) :-
ground(Goal),!,shell_solve_ground(Goal,Flag,FileName),start_shell(Flag,FileName).

shell(Goal,Flag,FileName) :-
shell_solve(Goal,Flag,FileName),start_shell(Flag,FileName).

shell_solve(Goal,Flag,FileName) :-
Goal,shell_write(Goal,Flag,FileName),nl,fail.

shell_solve(Goal,Flag,FileName) :-
shell_write('No (more) solutions',Flag,FileName),nl.

shell_solve_ground(Goal,Flag,FileName) :-
Goal,!,shell_write('Yes',Flag,FileName),nl.

shell_solve_ground(Goal,Flag,FileName) :-
shell_write('No',Flag,FileName),nl.

shell_prompt_file :- writeln('Enter file: ').

shell_prompt :- write('Next command? ').

shell_read(X,log,UserSpecifiedFile) :- read(X),
file_write(['Next command? ',X], UserSpecifiedFile).

shell_read(X,nolog,_) :- read(X).

shell_read_file(File) :- read(File).

shell_write(X,nolog,_) :- write(X).

shell_write(X,log,UserSpecifiedFile) :- write(X), file_write(X, UserSpecifiedFile).

file_write(X,UserSpecifiedFile) :- write_term(UserSpecifiedFile,Term,[ ]).

close_logging_file(UserSpecifiedFile) :- close(UserSpecifiedFile).
