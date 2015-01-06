; Recursive program to evaluate the size of a vector:

(defn size [v]
	(if (empty? v)
			0
			(inc (size (rest v)))))

(size [1 2 3])
;; 3

