%chess board
tile(["a",8]). tile(["b",8]). tile(["c",8]). tile(["d",8]). tile(["e",8]). tile(["f",8]). tile(["g",8]). tile(["h",8]).
tile(["a",7]). tile(["b",7]). tile(["c",7]). tile(["d",7]). tile(["e",7]). tile(["f",7]). tile(["g",7]). tile(["h",7]).
tile(["a",6]). tile(["b",6]). tile(["c",6]). tile(["d",6]). tile(["e",6]). tile(["f",6]). tile(["g",6]). tile(["h",6]).
tile(["a",5]). tile(["b",5]). tile(["c",5]). tile(["d",5]). tile(["e",5]). tile(["f",5]). tile(["g",5]). tile(["h",5]).
tile(["a",4]). tile(["b",4]). tile(["c",4]). tile(["d",4]). tile(["e",4]). tile(["f",4]). tile(["g",4]). tile(["h",4]).
tile(["a",3]). tile(["b",3]). tile(["c",3]). tile(["d",3]). tile(["e",3]). tile(["f",3]). tile(["g",3]). tile(["h",3]).
tile(["a",2]). tile(["b",2]). tile(["c",2]). tile(["d",2]). tile(["e",2]). tile(["f",2]). tile(["g",2]). tile(["h",2]).
tile(["a",1]). tile(["b",1]). tile(["c",1]). tile(["d",1]). tile(["e",1]). tile(["f",1]). tile(["g",1]). tile(["h",1]).

%enter wanted number of placed queens
n_queens(X) :-
    length(L, X), 				%creates list of X variables
    solution(L),				%L equals solution for X amount of queens
    write(L). 					%list of queen tile placements

%returns list of queen positions assigning them to list variables
solution([]).   	
solution([Q|QS]) :-
	solution(QS),
	tile(Q),
	valid(Q, QS). 				%for queen in queens list

%recursively check if queen placement is valid
valid(_, []).
valid([PX|PY], [[TX|TY]|QS]) :-
    convert(PX, PXV),			%returns queen x value
    convert(TX, TXV),			%returns others queens tiles x value
	PX =\= TX,
	PY =\= TY,
	TXV - PXV =\= TY - PY,
	TXV - PXV =\= PY - TY,
	valid([PX|PY], QS).

%converts row regex to its row X value
convert(L, V) :- 				%letter -> value
    ( L =:= "a" ->   V is 1;
    L =:= "b" ->   V is 2;
    L =:= "c" ->   V is 3;
    L =:= "d" ->   V is 4;
    L =:= "e" ->   V is 5;
    L =:= "f" ->   V is 6;
    L =:= "g" ->   V is 7;
    V is 8 ).