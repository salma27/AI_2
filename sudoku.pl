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

blocks([
		[], [], [],
		[], [], [],
		[], [], []
	]).

numbers([1, 2, 3, 4, 5, 6, 7, 8, 9]).

play():-
	start(Start),
	blocks(OriginalB),
	sudoku(Start, OriginalB, Blocks).
	
sudoku(Start, OriginalB, Blocks):-
	getBlocks(Start, Start, OriginalB, Blocks).

getBlocks(_, [], _, _).

getBlocks(Start, [Row|Rest], OriginalB, Blocks):-
	nth0(RowNum, Start, Row),
	addInBlock(RowNum, Row, OriginalB, Block),
	Blocks is Block,
	getBlocks(Start, Rest, Block, Block).
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], OriginalB, Block):-
	(RowNum = 0; RowNum = 1; RowNum = 2),
	nth0(0, OriginalB, B1),
	nth0(1, OriginalB, B2),
	nth0(2, OriginalB, B3),
	
	append([A, B, C], B1, NewB1),
	append([D, E, F], B2, NewB2),
	append([G, H, I], B3, NewB3),
	
	substitute(B1, OriginalB, NewB1, OriginalB2), 
	substitute(B2, OriginalB2, NewB2, OriginalB3), 
	substitute(B3, OriginalB3, NewB3, OriginalBNew), 
	
	Block is OriginalBNew.
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], OriginalB, Block):-
	(RowNum = 3; RowNum = 4; RowNum = 5),
	nth0(3, OriginalB, B1),
	nth0(4, OriginalB, B2),
	nth0(5, OriginalB, B3),
	
	append([A, B, C], B1, NewB1),
	append([D, E, F], B2, NewB2),
	append([G, H, I], B3, NewB3),
	
	substitute(B1, OriginalB, NewB1, OriginalB2), 
	substitute(B2, OriginalB2, NewB2, OriginalB3), 
	substitute(B3, OriginalB3, NewB3, OriginalBNew), 
	
	Block is OriginalBNew.
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], OriginalB, Block):-
	(RowNum = 6; RowNum = 7; RowNum = 8),
	nth0(6, OriginalB, B1),
	nth0(7, OriginalB, B2),
	nth0(8, OriginalB, B3),
	
	append([A, B, C], B1, NewB1),
	append([D, E, F], B2, NewB2),
	append([G, H, I], B3, NewB3),
	
	substitute(B1, OriginalB, NewB1, OriginalB2), 
	substitute(B2, OriginalB2, NewB2, OriginalB3), 
	substitute(B3, OriginalB3, NewB3, OriginalBNew), 
	
	Block is OriginalBNew.

getIndex(Start, Row, Index, Value):-
	nth0(Row, Start, RowMatrix),
	nth0(Index, RowMatrix, Value).

