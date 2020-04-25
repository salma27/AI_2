% start([[X, 2, 6, 3, X, X, 4, X, X], [X, X, X, 7, X, 8, X, 5, X], [8, 1, X, X, X, 6, X, X, 7],
%	   [X, 5, X, X, X, 3, X, 4, X], [1, X, 7, 9, X, 5], [],
%	   [], [], []]).

	   

% :- dynamic blocks/1.

% blocks(


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
	sudoku(S, [[], [], [],
			   [], [], [],
			   [], [], []], Blocks).
	
sudoku(Start, Blocks, FilledBlocks):-
	getBlocks(Start, Start, Blocks, FilledBlocks).


getBlocks(Start, [[A, B, C, D, E, F, G, H, I]|T], Blocks, FilledBlocks):-
	nth0(RowNum, Start, [A, B, C, D, E, F, G, H, I]),
	addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], Blocks, FilledBlocks),
	getBlocks(Start, T, Blocks, FilledBlocks).
	
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], Blocks, FilledBlocks):-
	(RowNum = 0; RowNum = 1; RowNum = 2),
	nth0(0, Blocks, B1),
	nth0(1, Blocks, B2),
	nth0(2, Blocks, B3),
	
	nth0(0, Blokcs, [A|B1]),
	nth0(0, Blocks, [B|B1]),
	nth0(0, Blocks, [C|B1]),
	
	nth0(1, Blocks, [D|B2]),
	nth0(1, Blocks, [E|B2]),
	nth0(1, Blocks, [F|B2]),
	
	nth0(2, Blocks, [G|B3]),
	nth0(2, Blocks, [H|B3]),
	nth0(2, Blocks, [I|B3]),
	FilledBlocks is Blocks.
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], Blocks, FilledBlocks):-
	(RowNum = 3; RowNum = 4; RowNum = 5),
	nth0(3, Blocks, B1),
	nth0(4, Blocks, B2),
	nth0(5, Blocks, B3),
	
	nth0(3, Blokcs, [A|B1]),
	nth0(3, Blocks, [B|B1]),
	nth0(3, Blocks, [C|B1]),
	
	nth0(4, Blocks, [D|B2]),
	nth0(4, Blocks, [E|B2]),
	nth0(4, Blocks, [F|B2]),
	
	nth0(5, Blocks, [G|B3]),
	nth0(5, Blocks, [H|B3]),
	nth0(5, Blocks, [I|B3]),
	FilledBlocks is Blocks.
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], Blocks, FilledBlocks):-
	(RowNum = 6; RowNum = 7; RowNum = 8),
	nth0(6, Blocks, B1),
	nth0(7, Blocks, B2),
	nth0(8, Blocks, B3),
	
	nth0(6, Blokcs, [A|B1]),
	nth0(6, Blocks, [B|B1]),
	nth0(6, Blocks, [C|B1]),
	
	nth0(7, Blocks, [D|B2]),
	nth0(7, Blocks, [E|B2]),
	nth0(7, Blocks, [F|B2]),
	
	nth0(8, Blocks, [G|B3]),
	nth0(8, Blocks, [H|B3]),
	nth0(8, Blocks, [I|B3]),
	FilledBlocks is Blocks.
	
	

getIndex(Start, Row, Index, Value):-
	nth0(Row, Start, RowMatrix),
	nth0(Index, RowMatrix, Value).

