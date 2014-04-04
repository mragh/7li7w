#DO
# 1. Write a program to find the nth Fibonacci number, fib(1) is 1, fib(4) is 3, so on
#    As bonus, solve the problem with recursion and with loops
findFibWhile := method(count, 
            fib := 1; i := 1; last := 0;
            while(i < count, temp := fib; fib = last + fib; last = temp; i = i + 1; ); 
            fib)
findFibWhile(1) println
findFibWhile(2) println
findFibWhile(4) println
findFibWhile(15) println
findFibRecurse := method(count,
            if(count <= 2, 1, findFibRecurse(count - 2) + findFibRecurse(count - 1)))

findFibRecurse(1) println
findFibRecurse(2) println
findFibRecurse(4) println
findFibRecurse(15) println
# 2. How would you change / to return 0 if the denominator is zero?
Number / := method(num, if(num == 0, 0, self * (num ** -1)))
# 3. Write a program to add up all the numbers in a 2D array
nums := list(list(1,2,3,4), list(1,2,3,4), list(1,2,3,4))
sum2d := method(twodArray, twodArray map(innerList, innerList sum) sum)
sum2d(nums) println
# 4. Add a slot called myAverage to a list that computes the average of all numbers in a list
#    What happens if there are no numbers in list. Bonus: Raise IO exception if any item in list not a number
nums := list(1,2,3,4,5,6)
IOException := Exception clone
List myAverage := method(self map(item, if (item type != "Number", IOException raise("Bad number value in list"))); length := self size; self sum/size)
nums myAverage println

nums := list(1,2,3,"jasdf",5,6)
e := try(nums myAverage println)
e catch(IOException,
    writeln(e coroutine backTraceString)
)
# 5. Write a prototype for 2D list. The dim(x, y) method should allocate list of y lists that are x elements long.
#    set(x, y, value) should set a value and get(x, y) should return that value
Matrix := List clone
dim := method(x, y, 
    matrix := Matrix clone; 
    for(i, 0, y-1, innerList := list(); 
    for(j, 0, x-1, innerList append(0)); 
    matrix x := x
    matrix y := y
    matrix append(innerList)))
Matrix set := method(x, y, value, self at(y) atPut(x, value))
Matrix get := method(x, y, self at(y) at(x))
matrix := dim(2,4) 
matrix set(1, 3, 14)
matrix set(0, 2, 12)
matrix get(1, 3) println
matrix println
# 6. Bonus: Write a tranpsose method so that (new_matrix get(y, x)) == matrix get(x, y) on original list
1234
5678

Matrix transpose := method(
    transposedMatrix := Matrix clone;
    y := self y
    x := self x
    x println
    y println
    for(i, 0, x-1, innerList := list();
    for(j, 0, y-1, innerList append(self get(i, j))); 
    transposedMatrix append(innerList));
    return transposedMatrix)

evilMatrix := matrix transpose

evilMatrix println
matrix println
matrix get(1, 3) println
evilMatrix get(3, 1) println
# 7. Write the matrix to a file, read matrix from a file
f := File with("matrix.txt")
f remove
f openForUpdating
f write(matrix serialized())
f close
reloadedMatrix := doFile("matrix.txt")
"Matrix reloaded" println
reloadedMatrix println
# 8. Write a program that gives you 10 tries to guess random number from 1-100. Give a hint of hotter or colder after first guess.
randomNumber := Random value( 1, 100) floor;
guesses := 0
allowed := 10
lastGuess := 0
stillGuessing := true
FailureException := Exception clone
evaluateProgress := method(guess, target, last, if(((guess - target) abs) < ((last - target) abs)) then("Warmer!" println) else("Colder! " println))
while(stillGuessing, 
    "Guess a number between 1 and 100!" println;
    guesses = guesses + 1;
    if(guesses >= allowed) then(randomNumber println; FailureException raise("You lose!!!"));
    userInput := File standardInput readLine asNumber;;
    if(userInput == randomNumber) then (stillGuessing = false; "GOT IT" println) else(
        if(guesses > 1) then(evaluateProgress(userInput, randomNumber, lastGuess));
        lastGuess = userInput;
        "Guess again!" println;
    );
    
    )



