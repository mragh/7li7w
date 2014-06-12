//http://www.scala-lang.org/api/current/

class Space(game : Game)
{
    var value = " "
    override def toString() = value
}

class TicTacSet(spaces : List[Space], name : String = "") {
    override def toString() = name + " - " + getValues() + " Winner: "+ hasWinner

    def getValues() : String = {
        return spaces.mkString(",")
    }

    def hasWinner() : Boolean = {
        return spaces.forall(_.value == "X") || 
                spaces.forall(_.value == "O")
    }

    def isTied() : Boolean = {
        return (spaces.exists(_.value == "X") && 
                spaces.exists(_.value == "O"))
    }
}

class Game()
{
    val grid = (3, 3)
    var rows = getBoard()
    var sets = getSets()
    def placeX(x: Int, y: Int) {
        rows(y)(x).value = "X"
    }
    def placeO(x: Int, y: Int) {
        rows(y)(x).value = "O"
    }
    def printGame()  {
        rows.foreach { cols =>
            println("_______")
            cols.foreach { col =>
                print("|"+col)
            }
            println("|")

        }
            println("_______")
    }

    def getBoard() : List[List[Space]] = {

        for (i <- List.range(0, grid._1)) yield 
            for (i <- List.range(0, grid._2)) yield new Space (this)
    }

    def winnerExists : Boolean = {
        return sets.exists(_.hasWinner())
    }

    def isTied : Boolean = {
        return sets.forall(_.isTied())
    }

    def columnHasWinner(colNumber: Int) : Boolean = {
        return (rows(0)(colNumber).value != " " )
    }

    def getSets() : List[TicTacSet] = {
        var sets = List[TicTacSet]()
        rows.foreach { row =>
            sets = sets :+ new TicTacSet(row, "Row")

        }
        var cols = for (y <- List.range(0, grid._2)) yield 
            for (x <- List.range(0, grid._1)) yield rows(x)(y)
        cols.foreach { col =>
            sets = sets :+ new TicTacSet(col, "Column")

        }

        //diags

        sets = sets :+ new TicTacSet(List(rows(0)(0), rows(1)(1), rows(2)(2)), "Diag")
        sets = sets :+ new TicTacSet(List(rows(2)(0), rows(1)(1), rows(0)(2)), "Diag")

        return sets
    }

}
val game = new Game

println(game.winnerExists)
println(game.isTied)
var xTurn = true
while(!game.winnerExists && !game.isTied)
{
    if(xTurn)
    {
        println("Player X")
    }else{
        println("Player O")
    }

    println("Pick row")
    var row = readLine.toInt-1
    println("Pick column")
    var column = readLine.toInt-1

    if(xTurn)
    {
        game.placeX(column, row)

    }else{
        game.placeO(column, row)
    }
    game.printGame()
    xTurn = !xTurn

}
if(game.isTied) 
{
    println("Tie game")
}else{
    println("Winner!")
}
