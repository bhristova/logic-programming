/* Елементите на непразен списък от различни естествени числа са последователно записани в посока,
обратна на часовниковата стрелка върху окръжност. Иванчо изтрива числата като следва следните две правила:
1. първо изтрива най-голямото число;
2. след като е изтрил число, продължава циклично да се движи в посока обратна на часовниковата стрелка
и изтрива петото срещнато неизтрито до момента число.
Да ce дефинира на пролог двуместен предикат ivan_last_erased(L, K), който по дадени непразен списък
от естествени числа L и естествено число К, разпознава дали последното изтрито от Иванчо число с К.
*/

append([],B,B).
append([H|T],B,[H|T1]):-append(T,B,T1).

member([K],K).
member(L,K):-append([K],_,L2),append(_,L2,L).

max(L,M):-member(L,M),not((member(L,A),A>M)).

concat([],B,B).
concat([H|T],B,[H|T1]):-concat(T,B,T1).

split_by_fifth_element([_|T],[],T,C):-C==5.
split_by_fifth_element([К],[К],[],C):-C<5.
split_by_fifth_element([H|T],[H|RL],RR,C):-C<5,C1 is C+1,split_by_fifth_element(T,RL,RR,C1).
split_by_fifth_element(L,RL,RR):-split_by_fifth_element(L,RL,RR,1).

split_by_number([],_,[],[]).
split_by_number([K],K,[],[]).
split_by_number([K|T],K,[],T).
split_by_number([H|T],K,[H|RL],RR):-H\=K,split_by_number(T,K,RL,RR).

reverse([],[]).
reverse([H|T],R):-reverse(T,R1),append(R1,[H],R).

len([],0).
len([_|T],R1):-length(T,R),R1 is R+1.

remove_every_fifth([K],K).
remove_every_fifth(L,K):-reverse(L,[H|T]),len([H|T],P),P==5,H==K.
remove_every_fifth(L,K):-len(L,P),P>5,split_by_fifth_element(L,RL,RR),concat(RR,RL,R),remove_every_fifth(R,K).

ivan_last_erased(L,K):-max(L,M),split_by_number(L,M,RL,RR),concat(RR,RL,R),remove_every_fifth(R,K).