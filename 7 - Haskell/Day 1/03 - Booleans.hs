(4 + 5) == 9
--True

(5 + 5) /= 10
--False

if (5 == 5) then "true" else "false"
--True

if 1 then "true" else "false"
--ERROR

--Haskell is strongly typed. 'if' takes strictly boolean types.

"one" + 1
--ERROR

--This error message gives us the first glimpse into Haskell’s type system:
--It says “There is no function called + that takes a Num argument followed
--by [Char], a list of characters.”

--The language is inferring types based on clues.

--You can see what Haskell’s type inference is doing:

:set +t
5
--5
--it :: Num a => a

5.0
--5.0
--it :: Fractional a => a

"hello"
--"hello"
--it :: [Char]

(5 == (2 + 3))
--True
--it :: Bool

:t 5
--5 :: Num a => a

