(ns clo.day3.day3)


; Use refs to create a vector of accounts in memory. Create credit and debit functions to change the balance of an account

(def accounts (ref [0 0]))
(defn debit [account-num amount] 
    (dosync (alter accounts assoc account-num (- (@accounts account-num) amount)))
)
(defn credit [account-num amount] 
    (dosync (alter accounts assoc account-num (+ (@accounts account-num) amount)))
)