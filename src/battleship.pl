:-[fileReader].
:-[loop].


copy(L,R) :- accCp(L,R).
accCp([],[]).
accCp([H|T1],[H|T2]) :- accCp(T1,T2).

start():-
	getData(EmptyBoard,CPUBoard,Rows,Columns),
	copy(EmptyBoard,PCEmptyBoard),
	printBoard(CPUBoard),
	writeln(Rows),
	writeln(Columns),
	loop(EmptyBoard,PCEmptyBoard,CPUBoard,Rows,Columns).


find([H|_],H,0).

find([],-1,_).

find([_|T],Element,Index):-
	find(T,Element,NextIndex),
	NextIndex > -1,
	Index is NextIndex+1.

find([_|T],Element,Index):-
	find(T,Element,NextIndex),
	NextIndex = -1,
	Index is NextIndex.

getMax([X],X).

getMax([H|T],Max):-
	getMax(T,H),
	Max =< H.

getMax([H|T],Max):-
	getMax(T,Max),
	Max > H.

