; SEQUENCES

; A sequence is an implementation-independent abstraction around all
; the various containers in the Clojure ecosystem. Sequences wrap all
; Clojure collections (sets, maps, vectors, and the like), strings, and even
; file system structures (streams, directories).

; If it supports the functions first, rest, and cons,
; you can wrap it in a sequence.

[1 2 3]
;; [1 2 3]

; Notice that we started with a vector. The result is not a list. repl actually
; responded with a sequence. That means we can treat all collections in a
; generic way.

; ----

; TESTS

; When you want to test a sequence, you will use a function called a
; predicate:

(every? number? [1 2 3 :four])
;; false

(some nil? [1 2 nil])
;; true

(not-every? odd? [1 3 5])
;; false

(not-any? number? [:one :two :three])
;; true

; ----

; CHANGING A SEQUENCE

; filter

(def words ["luke" "chewie" "han" "lando"])

(filter (fn [word] (> (count word) 4)) words)
;; ("chewie" "lando")

(map (fn [x] (* x x)) [1 1 2 3 5])
;; (1 1 4 9 25)

; ----

; LIST COMPREHENSION

; We have a couple of lists, colors and toys:

(def colors ["red" "blue"])

(def toys ["block" "car"])

; We can apply a function to all the colors
; with a list comprehension:

(for [x colors] (str "I like " x))
;; ("I like red" "I like blue")

; [x colors] binds x to an element from the colors list.

; when you bind to more than one list:

(for [x colors, y toys] (str "I like " x " " y "s"))
;; ("I like red blocks" "I like red cars" "I like blue blocks" "I like blue cars")

; The comprehension created every possible combination from the two
; lists. We can also apply a filter with the :when keyword in the bindings:

(defn small-word? [w] (< (count w) 4))

(for [x colors, y toys, :when (small-word? y)]
	(str "I like " x " " y "s"))
;; ("I like red cars" "I like blue cars")

; ----

; REDUCE

; You’ ve seen foldl , foldleft, and inject in Erlang, Scala, and Ruby. In Lisp,
; the equivalent is reduce. To compute a quick total or factorial:

(reduce + [1 2 3 4])
;; 10

(reduce * [1 2 3 4 5])
;; 120

(sort [3 1 2 4])
;; (1 2 3 4)

; and sort on the result of a function:

(defn abs [x] (if (< x 0) (- x) x))

(sort-by abs [-1 -4 3 2])
;; (-1 2 3 -4)