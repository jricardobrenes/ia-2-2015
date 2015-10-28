:- [printer].


getData(EmptyBoard,CPUBoard,Rows,Columns):-
	getBoard('../cpuboard.txt',CPUBoard),
	getBoard('../emptyboard.txt',EmptyBoard),
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



getCost(Stream,[H|T]):-
	open('../vectors.txt',read,Str),
	readWord(Str,W),
	close(Str),
	write(W).

readWord(InStream,W):-
         get_code(InStream,Char),
         checkCharAndReadRest(Char,Chars,InStream),
         atom_codes(W,Chars).


cleanString([],Temp,[_|Temp]).
cleanString([H|T],Temp,Result):-
	H=',',



checkCharAndReadRest(10,[],_):-  !.

checkCharAndReadRest(32,[],_):-  !.

checkCharAndReadRest(-1,[],_):-  !.

checkCharAndReadRest(end_of_file,[],_):-  !.

checkCharAndReadRest(Char,[Char|Chars],InStream):-
         get_code(InStream,NextChar),
         checkCharAndReadRest(NextChar,Chars,InStream).




