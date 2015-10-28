:- [printer].


getData(CPUBoard,Rows,Columns):-
	getBoard('../cpuboard.txt',CPUBoard),
	getVectors('../vectors.txt',Rows,Columns).

getBoard(Name,Board):-
	open(Name,read,Str),
	getLines(Str,Board),
	close(Str).

getLines(Stream,[]):-
	at_end_of_stream(Stream).
getLines(Stream,[H|T]):-
	\+at_end_of_stream(Stream),
	read(Stream,X),
	string_chars(X,H),
	getLines(Stream,T).

getVectors(Name,Rows,Columns):-
	open(Name,read,Str),
	getCosts(Str,[Rows|[Columns|_]]),
	close(Str).

getCosts(Stream,[]):-
	at_end_of_stream(Stream).
getCosts(Stream,[H|T]):-
	\+at_end_of_stream(Stream),
	read(Stream,X),
	string_chars(X,F),
	delete(F,',',H),
	getCosts(Stream,T).






