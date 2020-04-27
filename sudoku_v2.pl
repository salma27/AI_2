%momkn n4el X w n7ot 0
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

numbers(1).
numbers(2).
numbers(3).
numbers(4).
numbers(5).
numbers(6).
numbers(7).
numbers(8).
numbers(9).
allNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9]). 


play(X):-
	start(S),
	nth0(0, S, Start),
	sudoku(S, Start, AllChildren, X).
	 
sudoku(S, Start, AllChildren, Possible):- 
	getIndex(Start, RowNum, Index, 0),
	getPossibleValues(Start, RowNum, Index, Possible).
	
getPossibleValues(Start, RowNum, Index, Possible):-
	nth0(RowNum, Start, Row),
	allNumbers(All),
	getColList(Start, Index, [], Col),
	findall(Num, (member(Num, All),not(member(Num, Row)), not(member(Num, Col))), Possible).
	
	
getColList([], _, Tmp, Col):- Col = Tmp,!.
getColList([H|T], Index, Tmp, Col):-
	nth0(Index, H, Value),
	append(Tmp, [Value], Tmp2),
	getColList(T, Index, Tmp2, Col).

getIndex(Start, Row, Index, Value):-
	nth0(Row, Start, RowMatrix),
	nth0(Index, RowMatrix, Value).

	

