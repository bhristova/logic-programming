// задача 1 от контролно на 06.01.2024
// Тегло на списък от естествени числа наричаме сумата на всички елементи от списъка.
// Да се дефинира на пролог предикат p(X,Y), който по даден списък X от списъци от естествени числа
// генерира в Y списък без повторения от точно тези естествени числа,
// които са тегла на списък X, съдържащ само прости числа. 

append([], B, B).
append([H|T],B,[H|T1]):-append(T,B,T1).

member(X,L):-append([X],_,L2),append(_,L2,L).

get_weight([],0).
get_weight([H|T],R1):-get_weight(T,R), R1 is R + H.

get_lists_weights([],[]).
get_lists_weights([H|T],[W|R]):-get_weight(H,W),get_lists_weights(T,R).

remove_duplicates([],[]).
remove_duplicates([H|T],R):-member(H,T),remove_duplicates(T,R).
remove_duplicates([H|T],[H|R]):-not(member(H,T)),remove_duplicates(T,R).

generate_between(S,E,S):-S =< E.
generate_between(S,E,R):-S<E,S1 is S+1,generate_between(S1,E,R).

is_prime(X):-not((generate_between(2,X-1,R),0 is mod(X,R))),X\=1.

remove_composite_numbers([],[]).
remove_composite_numbers([H|T],[H|R]):-not(is_prime(H)), remove_composite_numbers(T,R).
remove_composite_numbers([H|T],R):-is_prime(H), remove_composite_numbers(T,R).

p(X,Y):-get_lists_weights(X,Y1),remove_duplicates(Y1,Y2),remove_composite_numbers(Y2,Y).