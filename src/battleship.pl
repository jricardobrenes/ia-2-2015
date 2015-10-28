:-[fileReader].
:-[utils].


start():-
	getData(EmptyBoard,CPUBoard,Rows,Columns),
	copy(EmptyBoard,EmptyBoard2),
	printBoard(CPUBoard),
	printBoard(EmptyBoard),
	printBoard(EmptyBoard2),
	write(Rows),nl,
	write(Columns).

