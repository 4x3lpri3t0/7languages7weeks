; Say you wanted to create a thread to handle a complex computation around a bit of encapsulated state.
; You could use an agent.
; Or say you wanted to start the computation of a value, but you did not want to await the result.
; As with Io, you could use a FUTURE.

(def finer-things (future (Thread/sleep 5000) "take time"))

@finer-things
;; wait some seconds... => "take time"

; A future takes a body of one or more expressions, returning the value of the last expression.

; The future starts in another thread.

; If you dereference it, the future will block until the value becomes available.

; A future is a concurrency construct that allows an asynchronous return before computation is complete.

; We can use futures to allow several long-running functions to run in parallel.