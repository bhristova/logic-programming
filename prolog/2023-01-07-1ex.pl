/* Елементите на непразен списък от различни естествени числа са последователно записани в посока,
обратна на часовниковата стрелка върху окръжност. Иванчо изтрива числата като следва следните две правила:
1. първо изтрива най-голямото число;
2. след като е изтрил число, продължава циклично да се движи в посока обратна на часовниковата стрелка
и изтрива петото срещнато неизтрито до момента число.
Да ce дефинира на пролог двуместен предикат ivan_last_erased(L, K), който по дадени непразен списък
от естествени числа L и естествено число К, разпознава дали последното изтрито от Иванчо число с К.
https://github.com/YanaRGeorgieva/Logic-programming/blob/master/%D0%98%D0%B7%D0%BF%D0%B8%D1%82%D0%B8%20%D0%BE%D1%82%20%D0%BC%D0%B8%D0%BD%D0%B0%D0%BB%D0%B8%20%D0%B3%D0%BE%D0%B4%D0%B8%D0%BD%D0%B8/%D0%9A%D0%BE%D0%BD%D1%82%D1%80%D0%BE%D0%BB%D0%BD%D0%B8/%D0%9A%D0%BE%D0%BD%D1%82%D1%80%D0%BE%D0%BB%D0%BD%D0%B8%20%D0%9A%D0%9D%202022-2023/received_862181525035684.jpeg
*/
append1([],B,B).
append1([H|T],B,[H|T1]):-append1(T,B,T1).

member(A,L):-append1([A],_,L2),append1(_,L2,L).

find_max2(L,M):-member(M,L),not((member(M1,L),M1>M)).

concat([],A,A).
concat([H|T],L2,[H|T1]):-concat(T,L2,T1).

list_len([],0).
list_len([_|T],C):-list_len(T,C1),C is C1 + 1.

remove_max([],[]).
remove_max(L,R):-find_max2(L,M),concat([M],L1,L2),concat(L3,L2,L),concat(L1,L3,R).

remove_kth_element([_|T],K,K,LT,R):-concat(T,LT,R).
remove_kth_element([],K,C,LT,R):-remove_kth_element(LT,K,C,[],R).
remove_kth_element([H|T],K,C,LT,R):-C<K,C1 is C+1,concat(LT,[H],RR),remove_kth_element(T,K,C1,RR,R).

remove_all_kth_elements([H],_,H).
remove_all_kth_elements(L,K,RE):-list_len(L,LL),LL>0,
remove_kth_element(L,K,1,[],R),remove_all_kth_elements(R,K,RE).

ivan_last_erased(L,K):-remove_max(L,R),remove_all_kth_elements(R,5,K).

/* Example: ivan_last_erased([1,3,18,9,5,6,7,10,22,13,4,5,19,2,8,9,14],T)
should return T = 8 */
