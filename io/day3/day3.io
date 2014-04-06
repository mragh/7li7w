#DO
# 1. Enhance the XML program to add spaces to show the indentation structure
"**** Number 1 ****" println
Builder := Object clone
Builder level := 0
Builder increment := method(self level = self level + 1; )
Builder decrement := method(self level = self level - 1; )
Builder forward := method(
    self increment
    padding := ""
    for(i, 0, self level - 1, padding = padding asMutable appendSeq("  "))
    writeln(padding, "<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(padding, "  ", content)))
    writeln(padding, "</", call message name, ">")
    self decrement)

Builder ul(
        li("Io"),
        li("Lua"),
        li(a("JavaScript")),
        li(table(tr(td("Cell"), td("Cell")))))

# 2. Create a list syntax that uses brackets.
"**** Number 2 ****" println
curlyBrackets := method(
    l := list clone
    call message arguments foreach(arg,
        l append(arg)
        )
    l
)
myList := {1, 2, "three", 'four', 5}
myList println
# 3. Enhance the XML program to handle attributes: if the first argument is a map (use curly bracket syntax), add 
#    add attributes to the XML program