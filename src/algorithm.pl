:-[fileReader].



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
