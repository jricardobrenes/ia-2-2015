:- [printer].


getData(CPUBoard,Vectors):-
	getBoard('../cpuboard.txt',CPUBoard),
	getVectors('../vectors.txt',Vectors).

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

getVectors(Name,Vectors):-
	open(Name,read,Str),
	getCosts(Str,Vectors),
	close(Str).

getCosts(Stream,[]):-
	at_end_of_stream(Stream).
getCosts(Stream,[H|T]):-
	\+at_end_of_stream(Stream),
	read(Stream,X),
	string_chars(X,F),
	delete(F,',',H),
	getCosts(Stream,T).






