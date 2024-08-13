/* задача 1 от контролно на 06.01.2024
Тегло на списък от естествени числа наричаме сумата на всички елементи от списъка.
Да се дефинира на пролог предикат p(X,Y), който по даден списък X от списъци от естествени числа
генерира в Y списък без повторения от точно тези естествени числа,
които са тегла на списък X, съдържащ само прости числа. */

append([],B,B).
append([H|T],R,[H|T1]):-append(T,R,T1).

member(A,L):-append([A],_,L1),append(_,L1,L).

list_weight([],0).
list_weight([H|L],W):-list_weight(L,W1),W is W1+H.

prime_helper(_,E,E).
prime_helper(N,S,E):-not((0 is mod(N,S))),S1 is S+1,prime_helper(N,S1,E).

is_prime_number(N):-N>2,E is N-1,prime_helper(N,2,E).

p([],[]).
p([LH|LL],R):-list_weight(LH,LW),p(LL,R),member(LW,R).
p([LH|LL],R):-list_weight(LH,LW),p(LL,R),not(is_prime_number(LW)).
p([LH|LL],[LW|R]):-list_weight(LH,LW),p(LL,R),not((member(LW,R))),is_prime_number(LW).

/* Example:
p([[2,2,3],[4,5,6],[3,8,9],[3,7,2,5],[1,1,3],[4,3]],T)
should return T = [17, 5, 7] */
