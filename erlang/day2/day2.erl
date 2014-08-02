-module(day2).
-export([get_def/2]).

% 1.  Consider a list of keyword value tuples such as 
% LangDict = [{erlang, "a functional language"}, {ruby, "an OO language"}].
% Write a function that accepts the list and a keyword and returns the associated value for the keyword


get_def(Dict, Keyword) -> [Definition || {Term, Definition} <- Dict, Term == Keyword].


% 2. Consider a shopping list that looks like 
% [{bananas, 3, 4.50}, {beer, 2, 20.0}]
% Write a list comprehension that build sa list of items in the form 
% [{item, total_price}] where total_price is quantity * price
% ANSWER
% [{Item, Quantity*Price} || {Item, Quantity, Price} <- [{bananas, 3, 4.50}, {beer, 2, 20.0}]].
