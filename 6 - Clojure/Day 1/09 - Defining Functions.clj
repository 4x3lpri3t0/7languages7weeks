; DEFINING FUNCTIONS

(defn force-it [] (str "Use the force," " Luke."))
;; #'user/force-it

; (defn [params] body)

(force-it)
;; "Use the force, Luke."

; you can specify an extra string describing the function:
(defn force-it
	"The first function a young Jedi needs"
	[]
	(str "Use the force," "Luke"))


(doc force-it)
(doc str)

