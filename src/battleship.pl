:-[fileReader].
<<<<<<< HEAD
:-[utils].
:-[algorithm].
=======
:-[loop].
>>>>>>> cf1678539ddd860c46b569617905ac0a8114580f

start():-
	getData(EmptyBoard,CPUBoard,Rows,Columns),
	copy(EmptyBoard,PCEmptyBoard),
	printBoard(CPUBoard),
<<<<<<< HEAD
	printBoard(EmptyBoard),
	printBoard(EmptyBoard2),
	write(Rows),nl,
	write(Columns).
=======
	writeln(Rows),
	writeln(Columns),
	loop(EmptyBoard,PCEmptyBoard,CPUBoard,Rows,Columns).
>>>>>>> cf1678539ddd860c46b569617905ac0a8114580f
