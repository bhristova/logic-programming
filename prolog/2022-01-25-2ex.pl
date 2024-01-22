/* Разделяне на краен списък L=[a1,a2,...,an] наричаме такава двойка (L1,L2) от списъци, че L1=[ai1,ai2,...,aik]],
L2=[aj1,aj2,...,ajn-k] и {i1,i2,...,ik}∪{aj1,aj2,...,ajn-k} = {1,2,...,n}. Разбиване на естествено число N
наричаме списък L от положителни цели числа, чиято сума е N. За едно разбиване L на N казваме,
че е уравновесимо, ако има такова разделяне (L1,L2) на L, че L1 и L2 са разбивания на едно и също естествено число.
Да се дефинира на пролог двуместен предикат equPart(N,L), който по дадено естествено число N при преудовлетворяване
генерира в L последователно всички уравновесими разбивания на N.
https://github.com/YanaRGeorgieva/Logic-programming/blob/master/%D0%98%D0%B7%D0%BF%D0%B8%D1%82%D0%B8%20%D0%BE%D1%82%20%D0%BC%D0%B8%D0%BD%D0%B0%D0%BB%D0%B8%20%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B8/%D0%9F%D0%B8%D1%81%D0%BC%D0%B5%D0%BD%D0%B8%20%D0%B8%D0%B7%D0%BF%D0%B8%D1%82%D0%B8/%D0%9F%D0%B8%D1%81%D0%BC%D0%B5%D0%BD%20%D0%B8%D0%B7%D0%BF%D0%B8%D1%82%20%D0%9A%D0%9D%202021-2022/LogProg-KN-2022janvier-e2-final1.pdf
*/

between1(A,B,A):-A=<B.
between1(A,B,R):-A<B,A1 is A+1,between1(A1,B,R).

genKS(1,S,[S]).
genKS(K,S,[N|R]):-K>0,between1(1,S,N),S>N,S1 is S-N,K1 is K-1,genKS(K1,S1,R).

n_into_list(N,R):-between1(0,N,R1),genKS(R1,N,R).

split_list([],[],[]).
split_list([H|L],[H|L1],L2):-split_list(L,L1,L2).
split_list([H|L],L1,[H|L2]):-split_list(L,L1,L2).

list_sum([],0).
list_sum([H|T],S):-list_sum(T,S1),S is S1 + H.

equPart(N,L):-n_into_list(N,L),split_list(L,L1,L2),list_sum(L1,S1),list_sum(L2,S1).
