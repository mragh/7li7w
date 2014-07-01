import scala.io.Source
import scala.actors._
import Actor._

class PageLoader(url : String) {
    val body = Source.fromURL(url).mkString
    def getPageSize() = body.length
    def getLinks() = """<.*a\s+href=\"(\/\S+)\">""".r.findAllMatchIn(body).map(m => m.group(1))
}

val urls = List("http://www.amazon.com",
                "https://twitter.com",
                "http://www.google.com",
                "http://www.cnn.com")

def timeMethod(method : () => Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("Method took "+ (end - start)/1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
    for(url <- urls) {
        val page = new PageLoader(url)
        println("Size for " + url + ": " + page.getPageSize())
        println("Links: "+ page.getLinks().length)
    }
}

def getPageSizeConcurrently() = {
    val caller = self
    for(url <- urls) {
        actor { caller ! (url, {
            val page = new PageLoader(url)
            page.getPageSize()
            })}
    }

    for(i <- 1 to urls.size) {
        receive {
            case (url, size) =>
            println("Size for " + url + ": " + size)
        }
    }
}

println("Sequential run:")
timeMethod { getPageSizeSequentially}
println("Concurrent run")
timeMethod {getPageSizeConcurrently}
println("Getting links")

