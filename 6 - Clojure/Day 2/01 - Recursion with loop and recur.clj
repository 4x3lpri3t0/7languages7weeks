; Recursive program to evaluate the size of a vector:

(defn size [v]
	(if (empty? v)
			0
			(inc (size (rest v)))))

(size [1 2 3])
;; 3

; You’ ve also learned that stacks can grow, so recursive algorithms will
; continue to consume memory until all memory is exhausted. Functional
; languages work around this limitation with tail recursion optimization.
; Clojure does not support implicit tail recursion optimization
; because of limitations of the JVM. You must explicitly recur through
; the use of loop and recur.

; Think of a loop as a let statement:

(loop [x x-initial-value, y y-initial-value] (do-something-with x y))

; if you don’t specify a recur, loop works exactly like a let:

(loop [x 1] x)

; Let’s refactor the size function to use recur:

(defn size [v]
	(loop [l v, c 0]
	(if (empty? l)
		c
		(recur (rest l) (inc c)))))

; Since we won’t actually return a value, we’ll maintain the
; result in a variable called an accumulator. In this case, c will maintain
; a count.

