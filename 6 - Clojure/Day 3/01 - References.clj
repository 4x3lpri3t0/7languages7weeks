; SOFTWARE TRANSACTIONAL MEMORY:
; Concurrency control mechanism analogous to database transactions
; for controlling access to shared memory in concurrent computing.
; It is an alternative to lock-based synchronization.

; We’ll look at STM and also several tools to share state across threaded applications.

; References and Transactional Memory

; Databases use transactions to ensure data integrity.
; Modern databases use at least two types of concurrency control.
; Locks prevent two competing transactions from accessing the same row at the same time.
; Versioning uses multiple versions to allow each transaction to have a private copy of its data.
; If any transaction interferes with another, the database engine simply reruns that transaction.
; Languages like Java use locking to protect the resources of one thread
; from competing threads that might corrupt them.
; Locking basically puts the burden of concurrency control on the programmer.
; This burden is too much to bear.

; Languages like Clojure use software transactional memory (STM).
; This strategy uses multiple versions to maintain consistency and integrity.
; Unlike Scala, Ruby, or Io, when you want to change the state of a reference
; in Clojure, you must do so within the scope of a transaction.

; REFERENCES

; ref (short for reference) is a wrapped piece of data.
; All access must conform to specified rules.
; In this case, the rules are to support STM.
; You cannot change a reference outside of a transaction.

(ref "Attack of the Clones")

; Assign the reference to a value:

(def movie (ref "Star Wars"))

; Get the reference back:

movie

; Value in the reference:

(deref movie)

; Short form of deref:

@movie

; You can mutate state only within a transaction:

(alter movie str ": The empire Strikes Back")
;; ERROR

(dosync (alter movie str ": The Empire Strikes Back"))

; We could also set some initial value with ref-set:

(dosync (ref-set movie "Star Wars: The Revenge of the Sith"))

@movie
;; "Star Wars: The Revenge of the Sith"

; We know that programs that behave in this manner will absolutely execute correctly,
; with respect to race conditions and deadlock.

; Most of our code will use functional paradigms,
; and we’ll save STM for the problems that could benefit the most from mutability.