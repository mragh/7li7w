
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
attrFirst := Map clone

attrs := {"href": "something"}
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
        li(a(attrs,"JavaScript")),
        li(table(tr(td("Cell"), td("Cell")))))
