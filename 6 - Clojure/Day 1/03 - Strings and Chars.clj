(println "master yoda\nluke skywalker\ndarth vader")

; you can convert things to a string with the str function:
(str 1)

(str "yoda, " "luke, " "darth")

(str "one: " 1 " two: " 2)

; To represent a character outside of double quotes:
\a

(str \f \o \r \c \e)
; "force"

(= "a" \a)
; false

; characters are not strings of length 1.

; Converting:
(= (str \a) "a")