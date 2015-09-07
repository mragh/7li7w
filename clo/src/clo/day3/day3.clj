(ns clo.day3.day3)


; Use refs to create a vector of accounts in memory. Create credit and debit functions to change the balance of an account

(def accounts (ref [0 0]))
(defn debit [account-num amount]
    (dosync (alter accounts assoc account-num (- (@accounts account-num) amount)))
)
(defn credit [account-num amount]
    (dosync (alter accounts assoc account-num (+ (@accounts account-num) amount)))
)

; Sleeping Barber (see book)
; Write a multithreaded program to determine how many haircuts a barber can give in 10 seconds

(def barber-free (agent true))
(def customers-tally (ref 0))

(defn set-false [x] (eval false)) ; TODO how to do this with anons or other way?
(defn set-true [x] (eval true))

(defn do-barber-stuff [cust]
  (dosync
  (if @barber-free
    (do
      (send barber-free  set-false)
      (Thread/sleep 20)
      (alter customers-tally inc)
      (send barber-free set-true)
    )
    )
  )
)

(defn run-test []
  (def start-time (System/currentTimeMillis))
  (def end-time (+ start-time 10000))
  (do
    (while (< (System/currentTimeMillis) end-time ) (
        do
          (Thread/sleep (+ 10 (rand-int 20)))
          (def customer (agent 0))
          (send customer do-barber-stuff)
      )
      )
  )
)
(run-test)
(print (str "Handled " @customers-tally " customers\n"))
