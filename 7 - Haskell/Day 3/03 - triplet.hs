-- POLYMOTPHIC DATA TYPE

module Main where
	data Triplet a = Trio a a a deriving (Show)

--On the left side we have data Triplet a. In this instance, a is a type variable.
--So now, any three-tuple with elements of the same type will be of type Triplet a:

:t Trio 'a' 'b' 'c'
--Trio 'a' 'b' 'c' :: Triplet Char

:t Trio 1 2 3
--Trio 1 2 3 :: Num a => Triplet a

:t Trio True False True
--Trio True False True :: Triplet Bool

--We’ ve built a whole template of types, describing any three elements whose type is the same.