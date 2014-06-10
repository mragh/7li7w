//http://www.scala-lang.org/api/current/

class Space(game : Game)
{
    var value = " "
    override def toString() = value
}

class Game()
{
    val grid = (3, 3)
    var rows = getBoard()
    def placeX(x: Int, y: Int) {
        rows(y)(x).value = "X"
    }
    def placeY(x: Int, y: Int) {
        rows(y)(x).value = "Y"
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
        return columnHasWinner(0)
    }

    def columnHasWinner(colNumber: Int) : Boolean = {
        return (rows(0)(colNumber).value != " " )
    }

}
val game = new Game
game.placeX(0, 0)
game.placeX(0, 1)
game.placeX(0, 2)
game.printGame()