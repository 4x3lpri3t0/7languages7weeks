; As with all functional languages, core data structures such as lists and
; tuples do the heavy lifting.

; LISTS

; A list is an ordered collection of elements. These elements can be anything,
; but in idiomatic Clojure, lists are used for code and vectors for
; data.

; LISTS => CODE
; VECTORS => DATA

(list 1 2 3)
'(1 2 3)

; The second form is called quoting.

; The four main operations for a list are first (the head), rest (the
; list minus the head), last (the last element), and cons (construct a new
; list given a head and a tail):

(first '(:r2d2 :c3po))
;; :r2d2
(last '(:r2d2 :c3po))
;; :c3po
(rest '(:r2d2 :c3po))
;; (:c3po)
(cons :battle-droid '(:r2d2 :c3po))
;; (:battle-droid :r2d2 :c3po)