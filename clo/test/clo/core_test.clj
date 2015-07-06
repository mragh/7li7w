(ns clo.core-test
  (:require [clojure.test :refer :all]
            [clo.day1.day1 :refer :all]
            [clo.day2.day2 :refer :all]
            [clo.day3.day3 :refer :all])
  (:import [clo.day2.day2 Cat Dog]))

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

(deftest unless-test
  (testing "Basic unless"
    (is (= 1 (unless false 1))))
  (testing "Unless with else"
    (is (= 2 (unless true 1 2)))))

(deftest animal-record-test
  (testing "Can get Cat name"
    (def kip (Cat. "Kip"))
    (is (= "Kip" (.getName kip)))
    )
  (testing "Can get Dog name"
    (def dog (Dog. "Monty"))
    (is (= "Monty" (.getName dog)))
    )
  )

(deftest account-update-test 
  (testing "Can debit"
    (def acct 1)
    (debit acct 5)
    (is (= -5 (accounts acct)))
  )
  (testing "Can credit"
    (def acct 0)
    (credit acct 47.50)
    (credit acct 4.80)
    (is (= 52.30 (accounts acct)))
  )
)