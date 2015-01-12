; What We Learned in Day 2

; We learned to use recursion. Since the JVM doesn’t support tailrecursion
; optimization, we had to use loop and recur.
; That looping construct allowed us to implement many algorithms you would
; usually implement with recursive function calls.

; We also used sequences. With them, Clojure encapsulates access to
; all of its collections. With a common library, we could apply common
; strategies for dealing with collections. We used different functions to
; mutate, transform, and search sequences. Higher-order functions
; added power and simplicity to the sequence libraries.

; With lazy sequences, we were able to add another powerful layer to
; sequences. Lazy sequences simplified algorithms. They also offered delayed
; execution, potentially significantly improving performance and
; loosening coupling.

; Next, we spent some time implementing types. With defrecord and protocols,
; we were able to implement types that were full citizens on the
; JVM.

; Finally, we used macros to add features to the language. We learned
; that there is a step, called macro expansion, that occurs before Clojure
; implements or interprets code. We implemented unless by using an if
; function within macro expansion.

; Day 2 Self-Study

; • Implement an unless with an else condition using macros.

(defmacro unless [test if-body else-body]
	(list 'if (list 'not test) if-body else-body))

; • Write a type using defrecord that implements a protocol.

;; TODO