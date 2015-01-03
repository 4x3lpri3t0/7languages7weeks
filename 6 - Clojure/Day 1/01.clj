; Clojure is Lisp on the JVM.

(class (/ 1 3))
;; clojure.lang.Ratio

; Clojure has a basic data type called a ratio.It’s a nice feature that will
; allow delaying computation to avoid the loss of precision. You can still
; easily work in floats if you so choose.

(mod 5 4)
;; 1

; This notation is called prefix notation.

(/ (/ 12 2) (/ 6 2))
;; 2

; There’s no ambiguity. Clojure will evaluate this statement in parenthetical
; order.

(< 1 2 3)
;; true

; Clojure supports strong, dynamic typing.