-- Write a sort that takes a list and returns a sorted list.
module Main where
	sort :: [Integer] -> [Integer]
	sort [] = []
	sort (h:t)
		| h > head t = (head t:[h])
		| otherwise = [] -- TODO: Finish

-- Write a sort that takes a list and a function that compares its two
--arguments and then returns a sorted list.

-- Write a Haskell function to convert a string to a number. The string
--should be in the form of $2,345,678.99 and can possibly have leading
--zeros.

-- Write a function that takes an argument x and returns a lazy
--sequence that has every third number, starting with x. Then, write
--a function that includes every fifth number, beginning with y.
--Combine these functions through composition to return every
--eighth number, beginning with x + y.

-- Use a partially applied function to define a function that will return
--half of a number and another that will append \n to the end
--of any string.

-- Write a function to determine the greatest common denominator
--of two integers.

-- Create a lazy sequence of prime numbers.