-module(day1).
-export([word_count/1]).
-export([count_to_ten/0]).
-export([print_status/1]).
-export([print_status/2]).

% write a function that uses recursion to return the number of words in a string
word_count("") -> 0;
word_count(Phrase) -> word_count(string:substr(Phrase, 1, max(string:rstr(Phrase, " ")-1,0)))+1.

% write a function that uses recursion to count to 10
count_to_ten(10) -> io:fwrite("10\n");
count_to_ten(N) -> io:fwrite([integer_to_list(N), "\n"]), count_to_ten(N+1).
count_to_ten() -> count_to_ten(1).

% write a function that uses matching to selectively print "success" or "error: message" given input of the form {error, Message} or success.

print_status(success) -> io:fwrite("success\n").
print_status(error, Message) -> io:fwrite(["error: ", Message, "\n"]).