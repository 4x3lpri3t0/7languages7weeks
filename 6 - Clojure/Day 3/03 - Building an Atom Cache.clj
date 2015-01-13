; First, we’ll create the cache:

(defn create
	[]
	(atom {}))

; We’ re simply creating an atom.

; Next, we need to be able to get a cache key:

(defn get
	[cache key]
	(@cache key))

; We take the cache and a key as arguments.
; The cache is an atom, so we dereference it and return the item associated with the key.

; Finally, we need to put an item in the cache:

(defn put
	([cache value-map]
		(swap! cache merge value-map))
	([cache key value]
		(swap! cache assoc key value)))

; We defined two different functions called put.
; The first version uses merge to allow us to add all of the associations in a map to our cache.
; The second version uses assoc to add a key and value. Here’s the cache in use.


; We add an item to the cache and then return it:

(def ac (create))

(put ac :quote "I'm your father, Luke.")

(println (str "Cached item: " (get ac :quote)))
;; Cached item: I'm your father, Luke.


; Atoms and refs are simple and safe ways to handle mutable state, SYNCHRONOUSLY.