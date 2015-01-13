; Like an atom, an agent is a wrapped piece of data.

; Like an Io future, the state of a dereferenced agent will block until a value is available.

; Users can mutate the data asynchronously using functions, and the updates will occur in another thread.

; Only one function can mutate the state of an agent at a time.

(defn twice [x] (* 2 x))

; Agent called tribbles that has an initial value of one:

(def tribbles (agent 1))

; Now, we can mutate tribbles by sending the agent a value:

(send tribbles twice)

; This function will run in another thread.

; Let’s get the value of the agent:

@tribbles
;; 2

; ----

; With this function, you can see the difference in the values that you read from each agent:

(defn slow-twice [x]
	(do
		(Thread/sleep 5000)
		(* 2 x)))

@tribbles

(send tribbles slow-twice)

@tribbles

; do this five seconds later
@tribbles


; We defined a slower version of twice that took five seconds.
; That was enough time to see the differences in @tribbles over time in the repl.

; So, you will get a value of tribbles.
; You might not get the latest changes from your own thread.

; If you want to be sure to get the latest value with respect to your own thread,
; you can call (await tribbles) or (await-for timeout tribbles),
; where timeout is a timeout in milliseconds.

; Keep in mind that await and await-for block only until actions from your thread are dispatched.
; This says nothing about what other threads may have asked the thread to do.

; If you think you want the latest value of something, you have already failed.

; Clojure’s tools involve working with a snapshot whose value is instantaneous
; and potentially out-of-date immediately.

; That’s exactly how versioning databases work for fast concurrency control.