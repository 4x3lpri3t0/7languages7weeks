; ANONYMOUS FUNCTIONS

; In Lisp, functions are just data. Higher-order functions are built into
; the language from the ground up because code is just like any other
; kind of data.

; In Clojure, you’ll define a higher-order function with the fn function.
; Typically, you’ll omit the name, so the form looks like (fn [parameters*] body).

; List of people's names:
(def people ["Lea", "Han Solo"])

; We can compute the length of one word like this:
(count "Lea")
;; 3

; List of the lengths of the names:
(map count people)
;; (3 8)

; count in this context is a higher order function.

; You can use the same building blocks to compute a list having
; twice the lengths of person names:
(defn twice-count [w] (* 2 (count w)))

(twice-count "Lando")
;; 10

(twice-count people)
;; (6 16)

; Since that function is so simple, we can write it as an anonymous function:
(map (fn [w] (* 2 (count w))) people)
;; (6 16)

; Shorter form:
(map #(* 2 (count %)) people)
;; (6 16)

; # defines an anonymous function, with % bound to each item of the sequence.
; # is called a reader macro

; ----

; We’re going to use a common vector, called v:
(def v [3 1 2])

; APPLY
; apply applies a function to an argument list.
; (apply f ’(x y)) works like (f x y):
(apply + v)
;; 6

(apply max v)
;; 3

; FILTER
; Takes a function that is a test and returns the sequence of elements
; that pass the test:
(filter odd? v)
;; (3 1)

(filter #(< % 3) v)
;; (1 2)