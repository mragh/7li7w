
import scala.collection.mutable.HashMap
var alternatives = new HashMap[String, String]
io.Source.fromFile("words.txt").getLines().foreach { line =>
    var values = line.split(",")
    alternatives = alternatives += values(0) -> values(1)

}




def cleanItUp(input: String) : String = {
    var working = input
    alternatives.foreach   { swearWord =>
        working = working.replaceAll(swearWord._1, swearWord._2)
    }

    return working
}

println(cleanItUp("shoot I stubbed my darn toe"))