(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c]))


(def directions [:north :east :south :west])


(defn turn
  [base amount]
  (rem (+ base amount) (count directions)))


(defrecord SimpleCompass [bearing]
  Compass
  (direction [_] (directions bearing))
  (left [_] (SimpleCompass. (turn bearing 3)))
  (right [_] (SimpleCompass. (turn bearing 1)))
  Object
  (toString [this] (str "[" (direction this) "]")))


; ----

; Create a new compass:
; (def c (SimpleCompass. 0))

; Turns return a new compass:
; (left c) ; returns a new compass
; #:SimpleCompass{:bearing 3}

; c ; original compass unchanged
; #:SimpleCompass{:bearing 0}

; ----

; With defrecord and protocol, Clojure offers the ability to build native
; code for the JVM, without Java.