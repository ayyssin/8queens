
dist(X, Y, Z):- Z is abs(X - Y).

canstrike(q(X1, Y1), q(X2, Y2)):- X1 is X2.
canstrike(q(X1, Y1), q(X2, Y2)):- Y1 is Y2.
canstrike(q(X1, Y1), q(X2, Y2)):- dist( X1, Y1, Z), dist( X2, Y2, Z ).

betw(L, U, X):- L =< U, L = X.
betw(L, U, X):- L < U, L1 is L+1, betw(L1, U, X).

cannotstrike([], q(X, Y)). 
cannotstrike([H|T], q(X, Y)):- not(canstrike(H, q(X, Y))), cannotstrike(T, q(X, Y)).
 
queens(I, N, P1, P1):- I is 0.
queens(I, N, P1, P2):- I > 0, I1 is I-1,
					   betw(1, N, X), betw(1, N, Y),
					   cannotstrike(P1, q(X, Y)), queens(I1, N, [q(X, Y)|P1], P2).	
