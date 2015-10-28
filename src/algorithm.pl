:-[fileReader].


test():-
	%getData(EmptyBoard,CPUBoard,Rows,Columns),
	getData(_,_,_,Columns),
%	max_list(Columns,X,Y),
	write(Columns).
%	write(X),
%	write(Y).

%getMax(Columns,Board,indActual,indMax,Val).
getMax([],-1,0).
getMax([X|T],X,Index):-
	NIndex is Index + 1,
	getMax(T,Y,NIndex), X >= Y.
getMax([X|T],N,Index):-
	NIndex is Index + 1,
	getMax(T,N,NIndex), N > X.



max_list([X|Xs],Max,Index):-
    max_list(Xs,X,0,0,Max,Index).

max_list([],OldMax,OldIndex,_, OldMax, OldIndex).
max_list([X|Xs],OldMax,_,CurrentIndex, Max, Index):-
    X > OldMax,
    NewCurrentIndex is CurrentIndex + 1,
    NewIndex is NewCurrentIndex,
    max_list(Xs, X, NewIndex, NewCurrentIndex, Max, Index).
max_list([X|Xs],OldMax,OldIndex,CurrentIndex, Max, Index):-
    X =< OldMax,
    NewCurrentIndex is CurrentIndex + 1,
    max_list(Xs, OldMax, OldIndex, NewCurrentIndex, Max, Index).


checkShoot([[X|_]|_],1,1,R):-R=1,X=' '.
checkShoot(_,1,1,R):-R=0.
checkShoot([[_|T]|T2],1,C,Result):-
	NC is C - 1,
	checkShoot([T|T2],1,NC,Result).
checkShoot([_|T],R,C,Result):-
	NR is R -1,
	checkShoot(T,NR,C,Result).

dec([Y|T],1,[X|T]):-
	X is Y-1.
dec([H|T1],E,[H|T2]):-
	E2 is E - 1,
	dec(T1,E2,T2).

















getMax2([X],X).
getMax2([X|T],X):- getMax2(T,Y), X >= Y.
getMax2([X|T],N):- getMax2(T,N), N > X.

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
