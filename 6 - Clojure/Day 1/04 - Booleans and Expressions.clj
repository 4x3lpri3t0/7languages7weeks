; Clojure has strong, dynamic typing.
; Dynamic typing means types are evaluated at run time.

(= 1 1.0)
;; true

(< 1 2)
;; true

; true is a symbol.
; But it is also something else.
; Clojure’s types are unified with the underlying Java type system.
; You can get the underlying class with the class function.
; Here’s the class of a boolean:

(class true)
;; java.lang.Boolean

(class (= 1 1))
;; java.lang.Boolean

(if (> 1 2) (println "True it is."))

(if false (println "true") (println "false"))
;; false

; 0 and "" are true, but nil is not:
(if 0 (println "true"))
;; true
(if "" (println "true"))
;; true
(if nil (println "true"))
;; nil