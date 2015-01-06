; What We Learned in Day 1

; Clojure is a functional language on the JVM. Like Scala and Erlang, this
; Lisp dialect is a functional language but not a pure functional language.
; It allows limited side effects.

; Lists and vectors are ordered containers with vectors optimized for
; random access and lists optimized for ordered traversal.

; Self-Study

; • Implement a function called (big st n) that returns true if a string
; 'st' is longer than n characters.

(defn big [st n]
	(if (> (count st) n) 
		true
		false))

(big "abc" 2)
;; true

(big "biiiiiig" 4)
;; true

(big "small" 10)
;; false

; • Write a function called (collection-type col) that returns :list, :map,
; or :vector based on the type of collection col.

(defn collection-type [col]
	(if (= (type col) clojure.lang.PersistentVector)
		"Vector"
	(if (= (type col) clojure.lang.PersistentList)
		"List"
	(if (= (type col) clojure.lang.PersistentArrayMap)
		"Map"
		"Not a list"))))

(collection-type '(1 2 3))
;; List

(collection-type [:a :b :c])
;; Vector

(collection-type {:name "axel", :occupation "programmer"})
;; Map