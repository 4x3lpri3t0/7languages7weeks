-- How many different ways can you find to write allEven?

module Main where

	allEven :: [Integer] -> [Integer]
	allEven [] = []
	allEven (h:t) = if even h then h:allEven t else allEven t

	allEvenGuard :: [Integer] -> [Integer]
	allEvenGuard [] = []
	allEvenGuard (h:t)
		| even h = h:allEvenGuard t
		| otherwise = allEvenGuard t

	allEvenListComprehension :: [Integer] -> [Integer]
	allEvenListComprehension (nums) = [(n) | n <- nums, even n]

-- Write a function that takes a list and returns the same list in reverse.
	
	reverseList :: [Integer] -> [Integer]
	reverseList [] = []
	reverseList x = reverse x
	--reverseList (h:t) = reverseList t:h -- BROKEN

-- Write a function that builds two-tuples with all possible combinations
-- of two of the colors black, white, blue, yellow, and red.
-- Note that you should include only one of (black, blue) and (blue, black).

	--combinations :: (String, String) -> [String]
	--combinations (col1, col2) = [(a, b) | a <- col1, b <- col2] -- BROKEN

-- Write a list comprehension to build a childhood multiplication table.
-- The table would be a list of three-tuples where the first two
-- are integers from 1–12 and the third is the product of the first two.

	--multiTable :: [Integer] -> [Integer]
	--multiTable (nums) = [(a, b) | a <- nums, b <- nums] -- BROKEN

	let nums = [1,2,3,4,5,6,7,8,9,10,11,12]
	[(a, b, a*b) | a <- nums, b <- nums]

-- Solve the map-coloring problem (Section 4.2, Map Coloring, on page 101) using Haskell.