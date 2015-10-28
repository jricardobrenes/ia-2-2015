header(['','1','2','3','4','5','6','7','8','9','10']).
border(['A','B','C','D','E','F','G','H','I','J']).

printBoard([]).
printBoard(X):-
	header(L),
	printVector(L),
	border(Z),
	printMatrix(X,Z).

printMatrix([],_).
printMatrix([X],[Y]):-
	write(Y),
	!,printVector(X).
printMatrix([X|T],[X2|T2]):-
	write(X2),
	printVector(X),
	printMatrix(T,T2).

printVector([]).
printVector([X]):-
	write(' '),!,write(X),nl.
printVector([X|T]):-
	write(' '),
	write(X),
	printVector(T).
