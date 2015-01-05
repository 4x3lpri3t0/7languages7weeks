; SETS

; A set is an unordered collection of elements.

#{:x-wing :y-wing :tie-fighter}

; We can assign those to a variable called spacecraft and then manipulate
; them:

(def spacecraft #{:x-wing :y-wing :tie-fighter})
;; #'user/spacecraft

(count spacecraft)
;; 3

(sort spacecraft)
;; (:tie-fighter :x-wing :y-wing)

(sorted-set 2 3 1)
;; #{1 2 3}

; Merge two sets:
(clojure.set/union #{:skywalker} #{:vader})

; Compute the difference:
(clojure.set/difference #{1 2 3} #{2})

; The set #{:jar-jar, :chewbacca} is an element but also a function.
; Sets test membership, like this:
(#{:jar-jar :chewbacca} :chewbacca)
;; :chewbacca

(#{:jar-jar :chewbacca} :luke)
;; nil