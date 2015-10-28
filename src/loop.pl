:-[fire].


loop(PlEmptyBoard,PCEmptyBoard,CPUBoard,Rows,Columns):-
	write('Ingrese La Fila de su disparo:'),
	read(Row),
	write('Ingrese la columna de su disparo:'),
	read(Col),
	write('Disparo en la casilla: '),
	writeln([Row,Col]),%!Llamada a funcion de disparar
	plFire(Row,Col,CPUBoard,PlEmptyBoard,NewPlEmptyBoard),
	writeln("---------ENEMY SHIPS--------"),
	printBoard(NewPlEmptyBoard),
	writeln("----------------------------"),
	write("Turno de la maquina, dispara en:"), %Calcular el disparo
	random_member(Ia_row,[1,2,3,4,5,6,7,8,9,10]),
	random_member(Ia_col,[1,2,3,4,5,6,7,8,9,10]),
	writeln([Ia_row,Ia_col]),
	write('Ingrese HIT (1) o MISS (-1)'),
	read(Action),
	((Action == 1, A = "X");(Action == -1, A = "O")),
	pcFire(Ia_row,Ia_col,A,PCEmptyBoard,NewPCEmptyBoard),
	writeln("--------PLAYER SHIPS--------"),
	printBoard(NewPCEmptyBoard),
	writeln("----------------------------"),
	loop(NewPlEmptyBoard,NewPCEmptyBoard,CPUBoard,Rows,Columns).