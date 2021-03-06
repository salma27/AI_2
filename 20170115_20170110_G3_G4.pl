start([
	[
		[0, 2, 6, 0, 0, 0, 8, 1, 0],
		[3, 0, 0, 7, 0, 8, 0, 0, 6],
		[4, 0, 0, 0, 5, 0, 0, 0, 7],
		[0, 5, 0, 1, 0, 7, 0, 9, 0],
		[0, 0, 3, 9, 0, 5, 1, 0, 0],
		[0, 4, 0, 3, 0, 2, 0, 5, 0],
		[1, 0, 0, 0, 3, 0, 0, 0, 2],
		[5, 0, 0, 2, 0, 4, 0, 0, 9],
		[0, 3, 8, 0, 0, 0, 4, 6, 0]
	]
	  ]).

blocks([
		[], [], [],
		[], [], [],
		[], [], []
	]).

allNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9]). 


play():-
	start(S),
	sudoku(S).	

isGoal([Start|Rest]):-not(nth0(_, Start, 0)), isGoal(Rest).
isGoal([]).

sudoku([Start|_]):- 
	isGoal(Start),
	write("Goal = "), 
	write(Start), !.

sudoku([Start|Rest]):- 
	getIndex(Start, RowNum, Index, 0),
	getPossibleValues(Start, RowNum, Index, Possible),
	Child = [],
	createChidren(Possible, Start, Child, Children, RowNum),
	append(Rest, Children, All),
	sudoku(All).


	
createChidren([], _, Child, Children, _):- Children = Child, !.
createChidren([H|T], Start, Child, Children, RowNum):-
	Tmp = Start,
	nth0(RowNum, Tmp, Row),
	select(0, Row, H, NewRow),
	select(Row, Tmp, NewRow, NewChild),
	append(Child, [NewChild], ChildList),
	createChidren(T, Start, ChildList, Children, RowNum).
	
	
getPossibleValues(Start, RowNum, Index, Possible):-
	nth0(RowNum, Start, Row),
	allNumbers(All),
	getColList(Start, Index, [], Col),
	blocks(OriginalB),
	getBlocks(Start, Start, OriginalB, Blocks),
	getSpecificBlock(Blocks, RowNum, Index, Block),
	findall(Num, (member(Num, All),not(member(Num, Row)), not(member(Num, Col)),not(member(Num, Block))), Possible).

getSpecificBlock(Blocks, RowNum, Index, Block):-
	N is ((Index//3) + (3 * (RowNum//3))),
	nth0(N, Blocks, Tmp),
	Block = Tmp.

getBlocks(_, [], Tmp, Blocks):- Blocks = Tmp, !.
getBlocks(Start, [Row|Rest], OriginalB, Blocks):-
	nth0(RowNum, Start, Row),
	addInBlock(RowNum, Row, OriginalB, Block),
	getBlocks(Start, Rest, Block, Blocks).
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], OriginalB, Block):-
	(RowNum = 0; RowNum = 1; RowNum = 2),
	nth0(0, OriginalB, B1),
	nth0(1, OriginalB, B2),
	nth0(2, OriginalB, B3),
	
	append([A, B, C], B1, NewB1),
	append([D, E, F], B2, NewB2),
	append([G, H, I], B3, NewB3),
	
	select(B1, OriginalB, NewB1, OriginalB2), 
	select(B2, OriginalB2, NewB2, OriginalB3),
	select(B3, OriginalB3, NewB3, OriginalBNew),
	
	Block = OriginalBNew.
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], OriginalB, Block):-
	(RowNum = 3; RowNum = 4; RowNum = 5),
	nth0(3, OriginalB, B1),
	nth0(4, OriginalB, B2),
	nth0(5, OriginalB, B3),
	
	append([A, B, C], B1, NewB1),
	append([D, E, F], B2, NewB2),
	append([G, H, I], B3, NewB3),
	
	select(B1, OriginalB, NewB1, OriginalB2), 
	select(B2, OriginalB2, NewB2, OriginalB3),
	select(B3, OriginalB3, NewB3, OriginalBNew),
	
	Block = OriginalBNew.
	
addInBlock(RowNum, [A, B, C, D, E, F, G, H, I], OriginalB, Block):-
	(RowNum = 6; RowNum = 7; RowNum = 8),
	nth0(6, OriginalB, B1),
	nth0(7, OriginalB, B2),
	nth0(8, OriginalB, B3),
	
	append([A, B, C], B1, NewB1),
	append([D, E, F], B2, NewB2),
	append([G, H, I], B3, NewB3),
	
	select(B1, OriginalB, NewB1, OriginalB2), 
	select(B2, OriginalB2, NewB2, OriginalB3),
	select(B3, OriginalB3, NewB3, OriginalBNew),
	
	Block = OriginalBNew.
	
getColList([], _, Tmp, Col):- Col = Tmp,!.
getColList([H|T], Index, Tmp, Col):-
	nth0(Index, H, Value),
	append(Tmp, [Value], Tmp2),
	getColList(T, Index, Tmp2, Col).

getIndex(Start, Row, Index, Value):-
	nth0(Row, Start, RowMatrix),
	nth0(Index, RowMatrix, Value).

	

