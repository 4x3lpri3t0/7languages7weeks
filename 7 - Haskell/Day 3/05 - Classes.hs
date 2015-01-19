--It’s not an object-oriented class, because there’s no data involved.
--In Haskell, classes let us carefully control polymorphism and overloading.

--A class defines which operations can work on which inputs.

--Think of it like a Clojure protocol.

--A class provides some function signatures.
--A type is an instance of a class if it supports all those functions.

class Eq a where
	(==), (/=) :: a -> a -> Bool

	-- Minimal complete definition:
	-- (==) or (/=)

	x /= y	=	not (x == y)
	x == y	=	not (x /= y)

--So, a type is an instance of Eq if it supports both == and /=.

--Also, if an instance defines one of those functions,
--the other will be provided for free.

--Classes do support inheritance, and it behaves like you think it should.

--Remember, instances of these classes are types, not data objects!