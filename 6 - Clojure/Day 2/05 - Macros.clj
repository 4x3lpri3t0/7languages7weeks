; A Clojure program executes in two stages. Macro expansion translates
; all macros in the language to their expanded form. You can see what’s
; happening with a command called macroexpand. We’ ve already used a
; couple of macros, called reader macros. A semicolon (;) is a comment, a
; single quote mark (’) is a quote, and a number sign (#) is an anonymous
; function. To prevent premature execution, we’ll put a quote in front of
; the expression we want to expand:

(macroexpand ''something-we-do-not-want-interpreted)
;; (quote something-we-do-not-want-interpreted)

(macroexpand '#(count %))

; In general, macro expansion will let you treat code like lists.
; If you don’t want a function to execute right away, quote it.

; Our unless will look like this:

(defmacro unless [test body]
	(list 'if (list 'not test) body))

; Clojure substitutes test and body without evaluating them.
; But we have to quote if and not.
; We also have to package them in lists.

; We’ re building a list of code in the exact form that Clojure will execute.
; We can macroexpand it:

(macroexpand '(unless condition body))

; What we’ve done is change the base definition of the language. We
; are adding our own control structure, without requiring the language
; designers to add their own keywords. Macro expansion is perhaps the
; most powerful feature of Lisp, and few languages can do it. The secret
; sauce is the expression of data as code, not just a string. The code is
; already in a higher-order data structure.