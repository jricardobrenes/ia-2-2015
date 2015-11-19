:-[fileReader].
:-[loop].

start():-
	getData(EmptyBoard,CPUBoard,Rows,Columns),
	copy(EmptyBoard,PCEmptyBoard),
	writeln(Rows),
	writeln(Columns),
	loop(EmptyBoard,PCEmptyBoard,CPUBoard,Rows,Columns).
