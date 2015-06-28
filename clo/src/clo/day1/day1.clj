(ns clo.day1.day1)
; function that returns true if a st is greater than n chars
(defn big [st n] (> (count st) n))
(big "blah" 3)
(big "blah" 4) 

; returns :map, :list, or :vector for the collection's type
(defn collection-type [col] (
		  def collections-available {(type {}) :map, (type (list 1)) :list, (type []) :vector})
		  (collections-available (type col)))
(collection-type [1,2,3])
(collection-type {:a "a"})
(collection-type (list 1 2 3))
