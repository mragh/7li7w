val alternatives = Map("shoot" -> "pucky", "darn" -> "beans")

def cleanItUp(input: String) : String = {
    var working = input
    alternatives.foreach   { swearWord =>
        working = working.replaceAll(swearWord._1, swearWord._2)
    }

    return working
}

println(cleanItUp("shoot I stubbed my darn toe"))