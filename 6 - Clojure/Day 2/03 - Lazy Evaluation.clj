; LAZY EVALUATION

; Using this strategy, Clojure’s sequence library computes
; values only when they are actually consumed.

; ----

; Finite Sequences with range

; Unlike Ruby, Clojure supports ranges as functions:
(range 1 10)
;; (1 2 3 4 5 6 7 8 9)

; You can specify any increment:
(range 1 10 3)
;; (1 4 7)

; You don’t have to specify the lower bound if there is no increment:
(range 10)
;; (0 1 2 3 4 5 6 7 8 9)

; The sequences created with range are finite.
; What if you wanted to create a sequence with no upper bound?
; That would be an infinite sequence.

; ----

; Infinite Sequences and take

(take 3 (repeat "Use the force, Luke"))

; We created an infinite sequence of the repeated string and then we took the first three.

; You can also repeat the elements in a list with cycle:

(take 5 (cycle [:lather :rinse :repeat]))

; We’ re taking the first five elements of the cycle from that vector.

; We can drop the first few elements of a sequence as well:

(take 5 (drop 2 (cycle [:lather :rinse :repeat])))

; But you don’t have to work inside out.
; You can use the new left-to-right operator (->>) to apply each function to a result:

(->> [:lather :rinse :repeat] (cycle) (drop 2) (take 5))

; Sometimes, left-to-right code is easier to read.
; What if you wanted to add some kind of separator between words? You’ d use interpose:

(take 5 (interpose :and (cycle [:lather :rinse :repeat])))

; We’ re taking the keyword :and and placing it between all the elements of an infinite sequence.

(take 20 (interleave (cycle (range 2)) (cycle (range 3))))

; We’ re interleaving two infinite sequences.

; ----

; The iterate function provides another way of creating sequences:
(take 5 (iterate inc 1))
;; (1 2 3 4 5)

(take 5 (iterate dec 0))
;; (0 -1 -2 -3 -4)

; ----

; CONSECUTIVE PARS IN FIBONACCI SEQUENCE

; Each number of a sequence is the sum of the last two.

; Given a pair, [a b], we can generate the next with [b, a + b].
; We can generate an anonymous function to generate one pair,
; given the previous value:

(defn fib-pair [[a b]] [b (+ a b)])

(fib-pair [3 5])
;; [5 8]

; Next, we’ll use iterate to build an infinite sequence:

(iterate fib-pair [1 1])

; We'll use map to grab the first element from all of those pairs:

(map
first
(iterate fib-pair [1 1]))

; That’s an infinite sequence. Now, we can take the first 5:

(take 5
(map
first
(iterate fib-pair [1 1])))

;; (1 1 2 3 5)

; Or we can grab the number at index 500, like this:

(nth (map first (iterate fib-pair [1 1])) 500)
;; (225... more numbers ...626)

; The performance is excellent. Using lazy sequences, you can often describe
; recursive problems like Fibonacci. Factorial is another example:

(defn factorial [n] (apply * (take n (iterate inc 1))))

(factorial 5)
;; 120

; We grab n elements from the infinite sequence (iterate inc 1). Then we
; take n of them and multiply them together with apply *.