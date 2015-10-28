%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SHOOT:                                                          %
%   - Recibe una fila (lista)                                     %
%   - Busca la columna 'C' a la que se debe disparar		  %
%   - Si no hay un barco ('X') es MISS (-1)                       %
%   - Si hay un barco ('S' o 'D') es HIT (1)                      %
%   - Devuelve la nueva fila con -1 o 1 en la pos. respectiva     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plShoot(C,C,['X'|_], -1).
plShoot(C,C,[_|_], 1).
plShoot(C,Cc,[_|T],R):-	Cc2 is Cc+1, plShoot(C,Cc2,T,R).
plShoot(C,L,R):- plShoot(C,0,L,R).


pcShoot(_,_,_,[],[]).
pcShoot(C,C,A,[_|T],[A|T2]):- Cc is C+1, pcShoot(C,Cc,A,T,T2).
pcShoot(C,Cc,A,[H|T],[H|T2]):- Cc2 is Cc+1, pcShoot(C,Cc2,A,T,T2).
pcShoot(C,A,L,M):- pcShoot(C,0,A,L,M).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GETROW:			                                  %
%   - Recibe un n�mero de fila 'R'				  %
%   - Recibe la matriz (lista de listas)                          %
%   - Busca la fila correspondiente                               %
%   - Guarda las filas a la izquierda de la fila 'R'              %
%   - Por aparte guarda las dem�s filas sin incluir 'R'           %
%   - Devuelve el lado izquierdo, la fila 'R' y el lado derecho   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

getRow([],[]).
getRow([H|T1],[H|T2]):- getRow(T1,T2).
getRow(R,R,[H|T],H, [], D):- getRow(T,D).
getRow(R,Rc,[H|T],Row,[H|Tl],D):- Rc2 is Rc+1, getRow(R,Rc2,T,Row,Tl,D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRE:					                          %
%   - Recibe un n�mero de fila 'R'		                  %
%   - Recibe un n�mero de columna 'C'                             %
%   - Recibe un tablero del juego 'B'                             %
%   - Obtiene la fila R (Row), su lado Izq. (L) y Der. (D)        %
%   - Obtiene la nueva fila con hit o miss (NewRow)               %
%   - Concatena lado izq. (L) con NewRow y lado der. (D)          %
%     para devolver la nueva matriz                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

print([]).
print([H|T]):- writeln(H), print(T).

plFire(R,C,B,E,Res):-
	getRow(R,0,B,Row,_,_),
	plShoot(C,Row,Res),
	((Res == 1, writeln('HIT'));(Res == -1, writeln('MISS'))),
	pcFire(R,C,Res,E,M),
	print(M).

pcFire(R,C,A,B,Res):-
	getRow(R,0,B,Row,L,D),
        pcShoot(C,A,Row,NewRow),
        append(L,[NewRow],M),
	append(M,D,Res).


sampleMatrix([['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','S','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','D','X','X','X','X','X','S'],
['X','X','X','D','X','X','X','X','X','X'],
['X','X','X','X','X','D','D','X','X','X'],
['X','X','S','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','S','X','X','X','X','X','X','D','X'],
['X','X','X','X','X','X','X','X','D','X']]).

emptyMatrix([['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X'],
['X','X','X','X','X','X','X','X','X','X']]).
