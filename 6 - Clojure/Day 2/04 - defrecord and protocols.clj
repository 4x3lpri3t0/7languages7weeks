; DEFRECORD and PROTOCOLS

; compass

(defprotocol Compass
	(direction [c])
	(left [c])
	(right [c]))

; This protocol defines an abstraction called Compass and enumerates
; the functions that a Compass must support.

; We are now free to implement the protocol with defrecord.

(def directions [:north :east :south :west])

; Every 1 you add to the base will move the compass ninety degrees
; to the right. We’ll take the remainder of the base/4 (more precisely,
; base/number-of-directions) so that we’ll wrap around correctly from
; :west to :north, like this:

(defn turn
	[base amount]
	(rem (+ base amount) (count directions)))

(turn 1 1)
;; 2

(turn 3 1)
;; 0

(turn 2 3)
;; 1

; It’s time to implement the protocol:

; (defrecor SimpleCompass [bearing]
; 	Compass

; We’ re defining a new record called SimpleCompass. It has one field called bearing.

; (direction [_] (directions bearing))

; The direction function looks up the element of directions at the bearing
; index. For example, (directions 3) returns :west. Each argument list has
; a reference to the instance (e.g., self in Ruby or this in Java), but we’re
; not using it, so we add _ to our argument list.

; Next, on to left and right:

; (left [_] (SimpleCompass. (turn bearing 3)))
; (right [_] (SimpleCompass. (turn bearing 1)))

; Remember, in Clojure, we’re using immutable values. That means that
; turning will return a new, modified compass rather than changing the
; existing compass in place. Both left and right use syntax that you have
; not seen before. (SomeType. arg) means fire the constructor for Simple-
; Compass, binding arg to the first parameter.

; We just need a function that returns a string representation,
; but toString is a method on java.lang.Object.
; That’s easy enough to add to our type:

; Object
; (toString [this] (str "[" (direction this) "]")))

