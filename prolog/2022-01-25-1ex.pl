/* Нека G = (V, E) е ориентиран граф. За два върха v, u є V на G казваме, че u е съсед на v,
ако (и, v) є E e ребро на G. Ще наричаме графа G К-съвършен, ако за всеки връх v є V
множеството от съседите на v съвпада с множеството от онези върхове u є V, за които има път (незадължително прост)
от v до u с дължина точно к. Представяне на G наричаме такъв списък Edges от двуелементни списъци,
че за всяко ребро (u, v) є E на G списъкът [u,v] е елемент на Edges и множеството Е и списъкът Edges
имат един и същ брой елементи. Да се дефинира на пролог двуместен предикат рс_Gr(Edges, K), който по дадени
представяне Edges на ориентиран граф G без изолирани върхове и естествено число К > 1 разпознава дали G e K-съвършен.
https://github.com/YanaRGeorgieva/Logic-programming/blob/master/%D0%98%D0%B7%D0%BF%D0%B8%D1%82%D0%B8%20%D0%BE%D1%82%20%D0%BC%D0%B8%D0%BD%D0%B0%D0%BB%D0%B8%20%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B8/%D0%9F%D0%B8%D1%81%D0%BC%D0%B5%D0%BD%D0%B8%20%D0%B8%D0%B7%D0%BF%D0%B8%D1%82%D0%B8/%D0%9F%D0%B8%D1%81%D0%BC%D0%B5%D0%BD%20%D0%B8%D0%B7%D0%BF%D0%B8%D1%82%20%D0%9A%D0%9D%202021-2022/LogProg-KN-2022janvier-e2-final1.pdf
*/

append([],B,B).
append([H|T],B,[H|T1]):-append(T,B,T1).

member(A,L):-append([A],_,L2),append(_,L2,L).

get_neighbours(V,E,E2):-member([V,E2],E).

exists_k_path(U,U,0,_).
exists_k_path(V,U,K,E):-K>0,V\=U,get_neighbours(V,E,N),K1 is K - 1,exists_k_path(N,U,K1,E).

not_k_paths(E,K):-get_neighbours(E1,E,EN),not(exists_k_path(E1,EN,K,E)).

рс_Gr(E,K):-not(not_k_paths(E,K)).
