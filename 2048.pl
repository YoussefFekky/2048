# Finalized on 1/5/2019 by Youssef Hassan, Waleed Abdelhakim, Amr Anwar, Youssef El-Hefnawy, and Mustafa Magdi

getColumn([X,Y,Z,F],Q,R):-
    nth1(Q,X,E1),
    nth1(Q,Y,E2),
    nth1(Q,Z,E3),
    nth1(Q,F,E4),
    R = [E1,E2,E3,E4].


twos(L) :-
      nextto(X , X , L) , !.
twos(L):-
      nextto(X , Y , L) ,
      Y = 0 ,
       X \= 0 ,!.


validR([A , B , C , D]) :-
          twos(A); twos(B);
          twos(C);twos(D)  , !.

validL([A,B,C,D]):-
         reverse(A , AA) ,
         reverse(B , BB) ,
         reverse(C , CC) ,
         reverse(D , DD) ,
         ( twos(AA);twos(BB) ;
          twos(CC);twos(DD)) , !.

validU(L):-
          getColumn(L , 1 , A),
          getColumn(L , 2 , B),
          getColumn(L , 3 , C),
          getColumn(L , 4 , D),
          validL([A,B,C,D]) , !.

validD(L):-
          getColumn(L , 1 , A),
          getColumn(L , 2 , B),
          getColumn(L , 3 , C),
          getColumn(L , 4 , D),
          validR([A,B,C,D]) , !.


merge([] , []).

merge([E,E|T] ,  [H|RR])  :-
         merge(T , RR) ,
         H is E * 2 ,!.

merge([E|T] , [E|R]) :-
         merge(T , R) .


fill([],R):-
    R =[0,0,0,0],!.
fill([A],R):-
    R =[0,0,0,A],!.

fill([A,B],R):-
    R =[0,0,A,B],!.

fill([A,B,C],R):-
    R =[0,A,B,C],!.

fill([A,B,C,D],R):-
    R =[A,B,C,D],!.


makeMove([A,B,C,D],R):-
    validL([A,B,C,D]),
    delete(A,0,A1),
    delete(B,0,B1),
    delete(C,0,C1),
    delete(D,0,D1),
    merge(D1,D3),
    merge(B1,B3),
    merge(C1,C3),
    merge(A1,A3),
    reverse(A3,A4),
    reverse(B3,B4),
    reverse(C3,C4),
    reverse(D3,D4),
    fill(A4,A5),
    fill(B4,B5),
    fill(C4,C5),
    fill(D4,D5),
    reverse(A5,A6),
    reverse(B5,B6),
    reverse(C5,C6),
    reverse(D5,D6),
    R = [A6,B6,C6,D6].

makeMove([A,B,C,D],R):-
    validU([A,B,C,D]),
    getColumn([A,B,C,D],1,A1),
    getColumn([A,B,C,D],2,B1),
    getColumn([A,B,C,D],3,C1),
    getColumn([A,B,C,D],4,D1),
    delete(A1,0,A2),
    delete(B1,0,B2),
    delete(C1,0,C2),
    delete(D1,0,D2),
    merge(D2,D3),
    merge(B2,B3),
    merge(C2,C3),
    merge(A2,A3),
    reverse(A3,A4),
    reverse(B3,B4),
    reverse(C3,C4),
    reverse(D3,D4),
    fill(A4,A5),
    fill(B4,B5),
    fill(C4,C5),
    fill(D4,D5),
    reverse(A5,A6),
    reverse(B5,B6),
    reverse(C5,C6),
    reverse(D5,D6),
    getColumn([A6,B6,C6,D6],1,A7),
    getColumn([A6,B6,C6,D6],2,B7),
    getColumn([A6,B6,C6,D6],3,C7),
    getColumn([A6,B6,C6,D6],4,D7),
    R = [A7,B7,C7,D7].

makeMove([A,B,C,D],R):-
    validR([A,B,C,D]),
    delete(A,0,A1),
    delete(B,0,B1),
    delete(C,0,C1),
    delete(D,0,D1),
    reverse(D1,D2),
    reverse(A1,A2),
    reverse(B1,B2),
    reverse(C1,C2),
    merge(D2,D3),
    merge(B2,B3),
    merge(C2,C3),
    merge(A2,A3),
    reverse(D3,D4),
    reverse(A3,A4),
    reverse(B3,B4),
    reverse(C3,C4),
    fill(A4,A5),
    fill(B4,B5),
    fill(C4,C5),
    fill(D4,D5),
    R = [A5,B5,C5,D5].

makeMove([A,B,C,D],R):-
    validD([A,B,C,D]),
    getColumn([A,B,C,D],1,A1),
    getColumn([A,B,C,D],2,B1),
    getColumn([A,B,C,D],3,C1),
    getColumn([A,B,C,D],4,D1),
    reverse(D1,D2),
    reverse(A1,A2),
    reverse(B1,B2),
    reverse(C1,C2),
    delete(A2,0,A3),
    delete(B2,0,B3),
    delete(C2,0,C3),
    delete(D2,0,D3),
    merge(D3,D4),
    merge(B3,B4),
    merge(C3,C4),
    merge(A3,A4),
    reverse(D4,D5),
    reverse(A4,A5),
    reverse(B4,B5),
    reverse(C4,C5),
    fill(A5,A6),
    fill(B5,B6),
    fill(C5,C6),
    fill(D5,D6),
    getColumn([A6,B6,C6,D6],1,A7),
    getColumn([A6,B6,C6,D6],2,B7),
    getColumn([A6,B6,C6,D6],3,C7),
    getColumn([A6,B6,C6,D6],4,D7),
    R = [A7,B7,C7,D7].


replaceZeroRow([], Count, [], Count).

replaceZeroRow([0|T], 1, [2|T], 0):-!.

replaceZeroRow([0|T], Count, [0|R], ResCount):-
         NewCount is Count-1,
         replaceZeroRow(T, NewCount, R, ResCount),!.

replaceZeroRow([H|T], Count, [H|R], NewCount):-
         replaceZeroRow(T, Count, R, NewCount).

replaceZero([Row|Tail], Count, [Row|R]):-
         replaceZeroRow(Row, Count, _, NewCount),
         NewCount > 0,
         replaceZero(Tail, NewCount, R),!.

replaceZero([Row|Tail], Count, [NewRow|Tail]):-
    replaceZeroRow(Row, Count, NewRow, _).


count(L, E, N) :-
          include(=(E), L, L2), length(L2, N).
count([A,B,C,D] , N) :-
          count(A , 0 , X),
          count(B , 0 , Y),
          count(C , 0 , Z),
          count(D , 0 , L),
          N is X + Y + Z + L + 1.


print(File,List):-
          string_to_list(List,Text),
          writeln(Text),
          open(File,append,Stream),
          write(Stream,Text),nl(Stream),
          close(Stream).

printPath([]).
printPath([H|T]):-
          H = [A , B , C , D],
          append(A , B , AB),
          append(AB , C , ABC),
          append(ABC , D , ABCD),
          print('output.txt' , ABCD) ,
          printPath(T),!.


solve([A , B , C , D] , [[A , B , C , D]]) :-
          max_list(A , X),
          max_list(B , Y),
          max_list(C , Z),
          max_list(D , L),
          max_list([X , Y , Z , L] , F),
          F =  2048,!.

solve(L , [L|PP]):-
         makeMove(L , RR) ,
         count(RR , Cnt) ,
         random(1 , Cnt , Ran),
         replaceZero(RR , Ran , R),
         solve(R , PP) , !.


start(L) :-
         solve(L , P) ,
         printPath(P) .

start():-
	solve([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], P),
	printPath(P).
