def getTheSize(strings : List[String]) : Int = {
    return strings.foldLeft(0)((sum, string) => sum + string.length)
}

println(getTheSize(List("a", "bb", "asdf", "fds")))