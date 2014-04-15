
"**** Number 3 ****" println
OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
    r := Map clone;
    call message arguments foreach(arg,
        r doMessage(arg)
        )
    r
)
Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)

Map attributes := method(
    self keys foreach(idx, key,
        value := self at(key);
        result := "" asMutable appendSeq(key ,"=\"", value, "\"")
    )
)

Builder := Object clone
Builder level := 0
Builder increment := method(self level = self level + 1; )
Builder decrement := method(self level = self level - 1; )
Builder forward := method(
    self increment
    padding := ""
    result := ""
    for(i, 0, self level - 1, padding = padding asMutable appendSeq("  "))
    firstArg := call message arguments at(0)
    firstContent := self doMessage(firstArg)
    if(firstContent type == "Sequence", 
        result = result asMutable appendSeq(padding, "<", call message name, ">\n") 
        result = result asMutable appendSeq(padding, padding, firstContent, "\n"),
    if(firstContent type == "Map", 
        result = result asMutable appendSeq(padding, "<", call message name, " ", firstContent attributes, ">\n"), 
        result = result asMutable appendSeq(padding, "<", call message name, ">\n") ))
    call message arguments slice(1) foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", result = result asMutable appendSeq(padding, "  ", content, "\n")))
    result = result asMutable appendSeq(padding, "</", call message name, ">\n")
    self decrement
    result)

s := File with("builderSyntax.txt") openForReading contents
doString(s) println

