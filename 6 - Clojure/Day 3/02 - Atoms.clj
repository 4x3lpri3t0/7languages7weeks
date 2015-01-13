; If you want thread safety for a single reference, uncoordinated with
; any other activity, then you can use atoms. These data elements allow
; change outside the context of a transaction.

(atom "Split at your own risk.")

; Now, bind an atom:

(def danger (atom "Split at your own risk."))

@danger
;; "Split at your own risk."

; You can bind danger to a new value with reset!:

(reset! danger "Split with impunity")

danger
;; "Split with impunity"

; reset! replaces the entire atom, but the preferred usage is to provide a
; function to transform the atom. If you’re changing a large vector, you
; can modify an atom in place with swap!

(def top-sellers (atom []))

(swap! top-sellers conj {:title "Seven Languages", :author "Tate"})
;; [{:title "Seven Languages", :author "Tate"}]

(swap! top-sellers conj {:title "Programming Clojure" :author "Halloway"})
;; [{:title "Seven Languages", :author "Tate"} {:title "Programming Clojure", :author "Halloway"}]