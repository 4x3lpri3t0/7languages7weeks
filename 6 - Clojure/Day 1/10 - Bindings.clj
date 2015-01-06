; BINDINGS

; the process of assigning parameters based on the inbound arguments
; is called binding.

(def line [[0 0] [10 20]])

; You could build a function to access the end of the line, like this:

(defn line-end [ln] (last ln))

(line-end line)
;; [10 20]

; The concept is called destructuring.
; We’ re taking a data structure apart
; and grabbing only the pieces that are important to us.

; TIC TAC TOE BOARD:
(def board [[:x :o :x] [:o :x :o] [:o :x :o]])
; #'user/board

; We pick up the second element of the second row of three:
(defn center [[_ [_ c _] _]] c)

; _ means whatever

(center board)
; :x

; We can simplify that function in a couple of different ways. First, we
; don’t have to list any of the wildcard arguments that come after the
; target arguments:
(defn center [[_ [_ c]]] c)

; Next, destructuring can happen in the argument list or also in a let
; statement. In any Lisp, you’ll use let to bind a variable to a value. We
; could use let to hide the destructuring from the clients of the center
; function:
(defn center [board]
	(let [[_ [_ c]] board] c))

; let takes two arguments. First is a vector with the symbol you want to
; bind ([[_ [_c]]]) followed by the value (board) that you want bound. Next
; is some expression that presumably uses that value (we just returned
; c).

; ----

; You can destructure a map:
(def person {:name "Jabba" :profession "Gangster"})

(let [{name :name} person] (str "The person's name is " name))
;; "The person's name is Jabba"

; ----

; You can also combine maps and vectors:
(def villains [{:name "Godzilla" :size "big"} {:name "Ebola" :size "small"}])

(let [[_ {name :name}] villains] (str "Name of the second villain: " name))