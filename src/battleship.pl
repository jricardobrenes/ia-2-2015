:-[fileReader].
:-[loop].

start():-
	getData(EmptyBoard,CPUBoard,Rows,Columns),
	copy(EmptyBoard,PCEmptyBoard),
	loop(EmptyBoard,PCEmptyBoard,CPUBoard,Rows,Columns,0,0).
