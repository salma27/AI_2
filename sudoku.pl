%/start([[X, 2, 6, 3, X, X, 4, X, X], [X, X, X, 7, X, 8, X, 5, X], [8, 1, X, X, X, 6, X, X, 7],
	   [X, 5, X, X, X, 3, X, 4, X], [1, X, 7, 9, X, 5], [],
	   [], [], []]).
/%
	   
start([
		[X, 2, 6, X, X, X, 8, 1, X],
		[3, X, X, 7, X, 8, X, X, 6],
		[4, X, X, X, 5, X, X, X, 7],
		[X, 5, X, 1, X, 7, X, 9, X],
		[X, X, 3, 9, X, 5, 1, X, X],
		[X, 4, X, 3, X, 2, X, 5, X],
		[1, X, X, X, 3, X, X, X, 2],
		[5, X, X, 2, X, 4, X, X, 9],
		[X, 3, 8, X, X, X, 4, 6, X]
	]).
	  
numbers([1, 2, 3, 4, 5, 6, 7, 8, 9]).

play():-
	start(S),
	sudoku(S).
	
getBlocks(Start):-
	.


getIndex(Start, Row, Index, Value):-
	nth0(Row, Start, PositionInRow),
	nth0(Index, PositionInRow, Value).

