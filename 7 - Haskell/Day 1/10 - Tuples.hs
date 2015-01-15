--A tuple is a collection of a fixed number of items.

--This implementation creates a tuple with consecutive Fibonacci numbers and
--uses a counter to assist in recursion:

module Main where
	fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
	fibTuple (x, y, 0) = (x, y, 0)
	fibTuple (x, y, index) = fibTuple (y, x + y, index - 1)

	--fibTuple (0, 1, 4)

	--We just use pattern matching to grab the first position:

	fibResult :: (Integer, Integer, Integer) -> (Integer)
	fibResult (x, y, z) = x

	fib :: Integer -> Integer
	fib x = fibResult (fibTuple (0, 1, x))