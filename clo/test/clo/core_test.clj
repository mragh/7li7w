(ns clo.core-test
  (:require [clojure.test :refer :all]
            [clo.day1.day1 :refer :all]))

(deftest big-test
  (testing "String under requested size"
    (is (= false (big "blah" 5))))

  (testing "String over requested size"
    (is (= true (big "blah" 2))))

  (testing "String equal to requested size"
    (is (= true (big "blah" 2)))))

(deftest collection-type-test 
	(testing "Vector" 
		(is (= :vector (collection-type [1,2,3]))))
	(testing "List" 
		(is (= :list (collection-type (list 1 2 3)))))
	(testing "Map" 
		(is (= :map (collection-type {:a "a"})))))
