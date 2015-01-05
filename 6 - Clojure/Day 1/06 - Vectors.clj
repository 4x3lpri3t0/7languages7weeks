; VECTORS

; Vectors are optimized for random access.

[:hutt :wookie :ewok]

; USE
; Lists for Code
; Vectors for Data

(first [:hutt :wookie :ewok])
;; :hutt

(nth [:hutt :wookie :ewok] 2)
;; :ewok

(nth [:hutt :wookie :ewok] 0)
;; :hutt

([:hutt :wookie :ewok] 2)
;; :ewok

; Note that vectors are functions, too.

(concat [:darth-vader] [:darth-maul])
;; (:darth-vader :darth-maul)

; Many of the functions that return collections use a Clojure abstraction
; called 'sequences'

; Clojure is returning a sequence and rendering it as a
; list in the repl.

(first [:hutt :wookie :ewok])
;; :hutt

(rest [:hutt :wookie :ewok])
;; (:wookie :ewok)

; We’ll use both of these features as we do pattern matching. Both lists
; and vectors are ordered.