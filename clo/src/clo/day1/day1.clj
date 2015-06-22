(ns clo.day1.day1)

(defn big [st n] (> (count st) n))
(big "blah" 3)
(big "blah" 4) 


(defn collection-type [col] (
		  def collections-available {(type {}) :map, (type (list 1)) :list, (type []) :vector})
		  (collections-available (type col)))
(collection-type [1,2,3])
(collection-type {:a "a"})
(collection-type (list 1 2 3))
