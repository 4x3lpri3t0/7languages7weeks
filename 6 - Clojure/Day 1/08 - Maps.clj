; MAPS

; A map is a key-value pair.

{:chewie :wookie :lea :human}
;; {:chewie :wookie, :lea :human}

{:darth-vader "obie wan", :luke "yoda"}
;; {:darth-vader "obi wan", :luke "yoda"}

; A word preceded with : is a keyword, like symbols in Ruby or atoms in
; Prolog or Erlang.

; Clojure has two kinds of forms that are used to name
; things in this way, keywords and symbols. Symbols point to something
; else, and keywords point to themselves.

; true and map are symbols.

; Use keywords to name domain entities such as a property in a map as
; you would use an atom in Erlang.

; ----
; Map called mentors:
(def mentors {:darth-vader "obi wan", :luke "yoda"})
;; #'user/mentors

(mentors :luke)
;; "yoda"

; Maps are also functions:
(:luke mentors)
;; "yoda"

; Merge:
(merge {:y-wing 2, :x-wing 4} {:tie-fighter 2})
;; {:tie-fighter 2, :y-wing 2, :x-wing 4}

; You can also specify an operator to use when a hash exists in both
; maps:
(merge-with + {:y-wing 2, :x-wing 4} {:tie-fighter 2 :x-wing 3})
;; {:tie-fighter 2, :y-wing 2, :x-wing 7}
; In this case, we combined the 4 and the 3 values associated with the xwing
; keys with +.

; Given an association, you can create a new association
; with a new key-value pair, like this:
(assoc {:one 1} :two 2)
;; {:two 2, :one 1}