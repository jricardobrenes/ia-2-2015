dic([['A',1],['B',2],['C',3],['D',4],['E',5],['F',6],['G',7],['H',8],['I',9],['J',10]]).


copy(L,R) :- accCp(L,R).
accCp([],[]).
accCp([H|T1],[H|T2]) :- accCp(T1,T2).


getIndex(Letter,Number):-
	dic(Dic),
	getIndexR(Letter,Number,Dic).

getIndexR(H,H2,[[H|[H2|_]]|_]).
getIndexR(Letter,Number,[_|T]):-
	getIndexR(Letter,Number,T).
