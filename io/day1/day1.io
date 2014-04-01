#FIND
#Some Io example problems
#? http://stackoverflow.com/questions/15687033/io-language-fibonacci-problems
#An io community that will answer questions
#http://www.reddit.com/r/iolang/
#A style guide with Io idioms
#http://iolanguage.org/scm/io/docs/IoGuide.html
#ANSWER
#Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly typed? Support answer w code
#strongly typed
#1 + "one" #fails
#works
one := Number 1
1  + one
#2
#Is 0 true or false? What about the empty string? Is nil true or false? Support answer iwth code.
#0 is true
true and 0
#"" is true
true and ""
#How can you tell what slots a prototype supports?
Number slotNames
#What is the difference between =, :=, and ::=? When would you use each one?
#= assigns, := creates if needed & assignes, ::= creates if needed, creates setter, assigns
# Would use = if know that slot is already there or enforcing duck-typing constraints, otherwise would use := to create & assign
# Would use ::= if want to add setter to prototype
#DO
#Run an io program from a file
#io day1.io
#Execute the code in a slot given its name
m := Object clone
m run := println "run"
m macro := method(name, perform(name))
m macro("run")