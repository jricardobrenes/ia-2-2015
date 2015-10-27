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

shoot(_,_,[],[]).
shoot(C,C,['X'|T],[-1|T2]):- Cc is C+1, shoot(C,Cc,T,T2), writeln('MISS!!').
shoot(C,C,[_|T],[1|T2]):- Cc is C+1, shoot(C,Cc,T,T2), writeln('HIT!!').
shoot(C,Cc,[H|T],[H|T2]):- Cc2 is Cc+1, shoot(C,Cc2,T,T2).
shoot(C,L,M):-	shoot(C,0,L,M).

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

fire(R,C,B,Result):-
	getRow(R,0,B,Row,L,D),
	shoot(C,Row,NewRow),
	append(L,[NewRow],M),
	append(M,D,Result).
