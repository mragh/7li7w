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
    matrix append(innerList)))
Matrix set := method(x, y, value, self at(y) atPut(x, value))
Matrix get := method(x, y, self at(y) at(x))
matrix := dim(10,20) 
matrix set(1, 1, 14)
matrix get(1, 1) println
matrix println
# 6. Bonus: Write a tranpsose method so that (new_matrix get(y, x)) == matrix get(x, y) on original list
# 7. Write th ematrix to a file, read matrix from a file
# 8. Write a program that gives you 10 tries to guess random number from 1-100. Give a hint of hotter or colder after first guess.