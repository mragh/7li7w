(ns clo.day2.day2)

; Macro of an unless with an else condition (inverse of if)
(defmacro unless [test body & rest] 
    (list 'if (list 'not test) body (first rest)))

; Write a type using defrecord that implements a protocol
(defprotocol IAnimal
    (makeNoise [this] "Make animal noise")
    (getAnimalType [this] "Returns what type of animal it is")
    (getName [this] "Returns animal's name"))

(defrecord Cat [name]
    IAnimal 
        (makeNoise [this] (print "Meow"))
        (getName [this] (:name this))
)

(defrecord Dog [name]
    IAnimal 
        (makeNoise [this] (print "Woof"))
        (getName [this] (:name this))
)
