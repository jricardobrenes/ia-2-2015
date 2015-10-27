%appendLists([],L,L).
%appendLists([H|T1],L2,[H|T2]):- appendLists(T1,L2,T2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SHOOT:                                                          %
%   - Recibe una fila (lista)                                     %
%   - Busca la columna 'C' a la que se debe disparar		  %
%   - Si no hay un barco ('X') es MISS (-1)                       %
%   - Si hay un barco ('S' o 'D') es HIT (1)                      %
%   - Devuelve la nueva fila con -1 o 1 en la pos. respectiva     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


plShoot(_,_,[],[]).
plShoot(C,C,['X'|T],[-1|T2]):- Cc is C+1, plShoot(C,Cc,T,T2), writeln('MISS!!').
plShoot(C,C,[_|T],[1|T2]):- Cc is C+1, plShoot(C,Cc,T,T2), writeln('HIT!!').
plShoot(C,Cc,[H|T],[H|T2]):- Cc2 is Cc+1, plShoot(C,Cc2,T,T2).
plShoot(C,L,M):- plShoot(C,0,L,M).

pcShoot(_,_,_,[],[]).
pcShoot(C,C,A,[_|T],[A|T2]):- Cc is C+1, pcShoot(C,Cc,A,T,T2).
pcShoot(C,Cc,A,[H|T],[H|T2]):- Cc2 is Cc+1, pcShoot(C,Cc2,A,T,T2).
pcShoot(C,A,L,M):- pcShoot(C,0,A,L,M).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GETROW:			                                  %
%   - Recibe un número de fila 'R'				  %
%   - Recibe la matriz (lista de listas)                          %
%   - Busca la fila correspondiente                               %
%   - Guarda las filas a la izquierda de la fila 'R'              %
%   - Por aparte guarda las demás filas sin incluir 'R'           %
%   - Devuelve el lado izquierdo, la fila 'R' y el lado derecho   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

getRow([],[]).
getRow([H|T1],[H|T2]):- getRow(T1,T2).
getRow(R,R,[H|T],H, [], D):- getRow(T,D).
getRow(R,Rc,[H|T],Row,[H|Tl],D):- Rc2 is Rc+1, getRow(R,Rc2,T,Row,Tl,D).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIRE:					                          %
%   - Recibe un número de fila 'R'		                  %
%   - Recibe un número de columna 'C'                             %
%   - Recibe un tablero del juego 'B'                             %
%   - Obtiene la fila R (Row), su lado Izq. (L) y Der. (D)        %
%   - Obtiene la nueva fila con hit o miss (NewRow)               %
%   - Concatena lado izq. (L) con NewRow y lado der. (D)          %
%     para devolver la nueva matriz                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plFire(R,C,B,Result):-
	getRow(R,0,B,Row,L,D),
	plShoot(C,Row,NewRow),
	append(L,[NewRow],M),
	append(M,D,Result).

%pcFire(B,Result):-
	%calculate(row,col),
	%askUser miss/hit,
	%miss? Action = -1 | hit? Action = 1,
	%getRow(R,0,B,Row,L,D),
        %pcShoot(C,Action,Row,NewRow),
        %append(L,[NewRow],M),
	%append(M,D,Result).

