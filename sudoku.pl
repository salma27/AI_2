%momkn n4el X w n7ot 0
start([[
		[0, 2, 6, 0, 0, 0, 8, 1, 0],
		[3, 0, 0, 7, 0, 8, 0, 0, 6],
		[4, 0, 0, 0, 5, 0, 0, 0, 7],
		[0, 5, 0, 1, 0, 7, 0, 9, 0],
		[0, 0, 3, 9, 0, 5, 1, 0, 0],
		[0, 4, 0, 3, 0, 2, 0, 5, 0],
		[1, 0, 0, 0, 3, 0, 0, 0, 2],
		[5, 0, 0, 2, 0, 4, 0, 0, 9],
		[0, 3, 8, 0, 0, 0, 4, 6, 0]
	]]).

blocks([
		[], [], [],
		[], [], [],
		[], [], []
	]).

numbers(1).
numbers(2).
numbers(3).
numbers(4).
numbers(5).
numbers(6).
numbers(7).
numbers(8).
numbers(9).


play():-
	start([Start]),
	sudoku(Start, AllChildren, 0),
	%lsa
	searchChildrenBFS(AllChildren, Goal).
 
%sudoku needs a base case

sudoku(Start, AllChildren, Counter):-
	blocks(OriginalB),
	getBlocks(Start, Start, OriginalB, Blocks), %blocks hyrg3le feha list mt2sma 9 blocks 
	Value is 0,
	getIndex(Start, RowNum, Index, Value),	%get RowNum & Index of l x le 3leh l dor
	getPossibleValues(Start, RowNum, Index, Possible),
	%lsa
	addChildren(RowNum, Index, Possible, NewChildren),	%addChildren subtitute values in the same position
														%hyrg3le list bkol l start l gdeda
	S is [Start],
	append(S, NewChildren, All),
	AllChildren is All,
	N is Counter + 1,
	nth0(N, AllChildren, NewStart),
	sudoku(NewStart, AllChildren, N).


%needs review
getPossibleValues(Start, RowNum, Index, Possible):-
	Possible is [],
	numbers(Num),
	nth0(RowNum, Start, Row),
	not(member(Num, Row)),
	getColList(Start, Index, [], Col, 0),
	not(member(Num, Col)),
	blocks(OriginalB),
	getBlocks(Start, Start, OriginalB, Blocks),
	getSpecificBlock(Blocks, RowNum, Index, Block),
	not(member(Num, Block)),
	append([Num], Possible, Possible).

getSpecificBlock(Blocks, RowNum, Index, Block):-
	N = (mod(Index, 3) + (3 * mod(RowNum, 3))),
	nth0(N, Blocks, Tmp),
	Block is Tmp.

getColList(_, Tmp, Col, 9):- Col is Tmp, !.
getColList(Start, Index, Tmp, Col, Counter):-
	nth0(Counter, Start, Row),
	nth0(Index, Row, Num),
	append([Num], Tmp, Tmp2),
	C is Counter + 1,
	getColList(Start, Index, Tmp2, Col, C).
	

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

