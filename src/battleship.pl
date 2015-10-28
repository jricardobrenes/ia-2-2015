:-[fileReader].
:-[loop].
:-[utils].

start():-
	getData(EmptyBoard,CPUBoard,Rows,Columns),
	copy(EmptyBoard,PCEmptyBoard),
	printBoard(CPUBoard),
	writeln(Rows),
	writeln(Columns),
	loop(EmptyBoard,PCEmptyBoard,CPUBoard,Rows,Columns).
