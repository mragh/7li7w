//http://www.scala-lang.org/api/current/

class Game()
{
    var rows = List(List(" ", " ", " "), List(" ", " ", " "), List(" ", " ", " "))
    def placeX(x: Int, y: Int) {
        rows = rows.updated(y, rows(y).updated(x, "X"))
        println(printGame)
    }
    def printGame()  {
        rows.foreach { cols =>
            println("_______")
            cols.foreach { col =>
                print("|"+col)
            }
            println("|")

        }
    }

}
val game = new Game