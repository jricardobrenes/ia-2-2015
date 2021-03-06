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
	at_end_of_stream(Stream),!.
getLines(Stream,[H|T]):-
	\+at_end_of_stream(Stream),
	read(Stream,X),
	string_chars(X,H),
	getLines(Stream,T).

getVectors(Name,Rows,Columns):-
	open(Name,read,Str),
	getCosts(Str,Rows,Columns),
	close(Str).

getCosts(Stream,Rows,Columns):-
	readLine(Stream,Rows,10),
	readLine(Stream,Columns,10).

readLine(_,[],0):-!.
readLine(Str,[H|T],N):-
	readWord(Str,H),
	N1 is N-1,
	readLine(Str,T,N1).

readWord(InStream,X):-
         get_code(InStream,Char),
         checkCharAndReadRest(Char,Chars,InStream),
         atom_codes(W,Chars),
	 atom_number(W,X).

checkCharAndReadRest(10,[],_):-  !.

checkCharAndReadRest(32,[],_):-  !.

checkCharAndReadRest(-1,[],_):-  !.

checkCharAndReadRest(end_of_file,[],_):-  !.

checkCharAndReadRest(Char,[Char|Chars],InStream):-
         get_code(InStream,NextChar),
         checkCharAndReadRest(NextChar,Chars,InStream).




