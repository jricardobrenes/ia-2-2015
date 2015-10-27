turn() :-
	repeat,
	write('Ingrese la fila de su disparo:'),
	read(Row),
	write('Ingrese la columna de su disparo:'),
	read(Col),
	write('Disparo en la casilla: '),
	writeln([Row,Col]),%!Llamada a funcion de disparar
	random_member(Rresult,["HIT!","MISS :/"]),
	writeln(Rresult),
	write("Turno de la maquina, dispara en:"),
	random_member(Ia_row,[1,2,3,4,5,6,7,8,9,10]),
	random_member(Ia_col,[1,2,3,4,5,6,7,8,9,10]),
	writeln([Ia_row,Ia_col]),%!Llamada a funcion de disparar
	fail.



