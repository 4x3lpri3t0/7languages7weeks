--Takes a list of integers and returns a list of even integers:

module Main where
	allEven :: [Integer] -> [Integer]
	allEven [] = []
	allEven (h:t) = if even h then h:allEven t else allEven t

