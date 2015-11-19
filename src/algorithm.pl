:-[fileReader].


start():-
	max_list([10,0,0,0,2,0,0,0,0,9],V,I,[1]),
	write(V - I).

test():-
	getData(EmptyBoard,_,Rows,Columns),
	getCoords(EmptyBoard,Rows,Columns,X,Y,[]),
	write(X),write(','),write(Y).

getCoords(Board,Rows,Columns,X,Y,Excluded):-
	max_list(Columns,_,Y,Excluded),
	max_list(Rows,_,X,[]),
	checkShoot(Board,X,Y,1),!.

getCoords(Board,Rows,Columns,X2,Y2,Excluded):-
	max_list(Columns,_,Y,Excluded),
	max_list(Rows,_,X,[]),
	checkShoot(Board,X,Y,0),
	append(Excluded,[Y],NewExcluded),
	getCoords(Board,Rows,Columns,X2,Y2,NewExcluded).


max_list([_|Xs],Max,Index,Excluded):-
	member(1,Excluded),
	max_list(Xs,-1,1,1,Max,Index,Excluded),!.

max_list([X|Xs],Max,Index,Excluded):-
    max_list(Xs,X,1,1,Max,Index,Excluded),!.

max_list([],OldMax,OldIndex,_, OldMax, OldIndex,_).
max_list([X|Xs],OldMax,OldIndex,CurrentIndex, Max, Index,Excluded):-
    X > OldMax,member(NewCurrentIndex,Excluded),
    NewCurrentIndex is CurrentIndex + 1,
    max_list(Xs, OldMax, OldIndex, NewCurrentIndex, Max, Index,Excluded).

max_list([X|Xs],OldMax,_,CurrentIndex, Max, Index,Excluded):-
    X > OldMax,
    NewCurrentIndex is CurrentIndex + 1,
    NewIndex is NewCurrentIndex,
    max_list(Xs, X, NewIndex, NewCurrentIndex, Max, Index,Excluded).


max_list([X|Xs],OldMax,OldIndex,CurrentIndex, Max, Index,Excluded):-
    X =< OldMax,
    NewCurrentIndex is CurrentIndex + 1,
    max_list(Xs, OldMax, OldIndex, NewCurrentIndex, Max, Index,Excluded).



checkShoot([[X|_]|_],1,1,R):-R=1,X=' ',!.
checkShoot(_,1,1,R):-R=0,!.
checkShoot([[_|T]|T2],1,C,Result):-
	NC is C - 1,
	checkShoot([T|T2],1,NC,Result),!.
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
