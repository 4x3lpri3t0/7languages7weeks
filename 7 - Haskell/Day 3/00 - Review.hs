-- CLASSES AND TYPES

-- Type System:
--* Type inference
--* Robust
--* Polymorphic

-- BASIC TYPES

-- Turn on the type option on the shell
:set +t

'c'
-- it :: Char

"abc"
-- it :: [Char]

['a', 'b', 'c']
-- it :: [Char]

-- A string is an array of characters.

"abc" == ['a', 'b', 'c']
--True

