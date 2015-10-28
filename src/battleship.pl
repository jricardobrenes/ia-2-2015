:-[fileReader].


start():-
	getData(CPUBoard,Rows,Columns),
	printBoard(CPUBoard),
	write(Rows),
	write(Columns).

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
