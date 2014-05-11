% DO
% 1 - Reverse the elements of a list
backwards([Head|[]], [Head]).
backwards([Head|Tail], ReversedList) :- backwards(Tail, TailReversed), append(TailReversed, [Head], ReversedList).
% e.g. backwards([1,2,3], Reversed).
% 2 Find the smallest element of a list
smallest([Head|[]], Head).
smallest([Head|Tail], Head) :- smallest(Tail, SmallestTail), Head < SmallestTail.
smallest([Head|Tail], SmallestTail) :- smallest(Tail, SmallestTail), Head > SmallestTail.
% eg smallest([11,2,3], SmallestValue).
% 3 Sort the elements of a list 
sorted([Head|[]], Head).
sorted([Head|[Head1|[]]], [Head,Head1]) :- Head < Head1. 
sorted([Head|[Head1|[]]], [Head1,Head]) :- Head > Head1. 
sorted(UnsortedList, [FirstOfSorted|RestOfSorted]) :- smallest(UnsortedList, FirstOfSorted), subtract(UnsortedList, [FirstOfSorted], RestOfUnsorted), sorted(RestOfUnsorted, RestOfSorted).
