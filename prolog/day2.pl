% DO
% 1 - Reverse the elements of a list
backwards([Head|[]], [Head]).
backwards([Head|Tail], ReversedList) :- backwards(Tail, TailReversed), append(TailReversed, [Head], ReversedList).
% 2 Find the smallest element of a list
% 3 Sort the elements of a list 
