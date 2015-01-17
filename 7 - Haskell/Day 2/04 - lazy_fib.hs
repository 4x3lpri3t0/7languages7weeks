-- Some recursive functions work more efficiently using list construction.

module Main where
	lazyFib x y = x:(lazyFib y (x + y))

	fib = lazyFib 1 1

	fibNth x = head (drop (x - 1) (take (x) fib))


	-- fib seeds lazyFib with the first two numbers

	-- helper function that allows the user to grab just one
	-- number of the sequence with drop and take

take 5 (lazyFib 0 1)
--[1,1,2,3,5]

take 5 (fib)
--[1,1,2,3,5]

take 5 (drop 20 (lazyFib 0 1))
--[6765,10946,17711,28657,46368]

fibNth 3
-- 2

fibNth 6
-- 8