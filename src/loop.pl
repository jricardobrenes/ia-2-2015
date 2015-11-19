:-[fire].
:-[utils].
:-[algorithm].

loop(PlEmptyBoard,PCEmptyBoard,CPUBoard,Rows,Columns,PLC,CPUC):-
	((PLC == 10,writeln('Jugador gana.'),!);
	(CPUC == 10,writeln('CPU gana.'),!);
	(write('Ingrese La Fila de su disparo (Con comillas simples \'A-J\'): '),
	read(RowLett), getIndex(RowLett,Row),
	write('Ingrese la columna de su disparo: (1-10)'),
	read(Col),
	write('Disparo en la casilla: '),
	writeln([RowLett,Col]),%!Llamada a funcion de disparar
	plFire(Row,Col,CPUBoard,PlEmptyBoard,NewPlEmptyBoard,Result),
	((Result == 'X', NPLC is PLC + 1);(Result == 'O', NPLC is PLC)),
	writeln("---------ENEMY SHIPS--------"),
	printBoard(NewPlEmptyBoard),
	writeln("----------------------------"),
	write("Turno de la maquina, dispara en:"),
	%Calcular el disparo
	getCoords(PCEmptyBoard,Rows,Columns,Ia_row,Ia_col,[]),
	getIndex(Letter_row,Ia_row),
	writeln([Letter_row,Ia_col]),
	write('Ingrese HIT (1) o MISS (-1)'),
	read(Action),
	((Action == 1, A = "X",dec(Rows,Ia_row,NewRows),dec(Columns,Ia_col,NewColumns),NCPUC is CPUC+1);
	(Action == -1, A = "O"),copy(Rows,NewRows),copy(Columns,NewColumns),NCPUC is CPUC),
	pcFire(Ia_row,Ia_col,A,PCEmptyBoard,NewPCEmptyBoard),
	writeln("--------PLAYER SHIPS--------"),
	printBoard(NewPCEmptyBoard),
	writeln("----------------------------"),
	loop(NewPlEmptyBoard,NewPCEmptyBoard,CPUBoard,NewRows,NewColumns,NPLC,NCPUC))).












