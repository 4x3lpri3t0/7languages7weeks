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


--Add two Fibonacci sequences together, offset by one:
take 5 (zipWith (+) fib (drop 1 fib))

--zipWith: pairs each item of the infinite list by index.

--Double a range:

take 5 (map (*2) [1 ..])

--We’ re using map to apply the partially applied function * 2 to the infinite
--range [1 ..], and then we’re using the infinite range, beginning with 1.

--We can use function composition in conjunction with partially applied functions and lazy sequences effortlessly:
take 5 (map ((* 2) . (* 5)) fib)
--[10,10,20,30,50]

--We first have (* 5).
--That’s a partially applied function.
--Whatever we pass into the function will be multiplied by five.
--Pass that result into another partially applied function, (* 2).
--Pass that composed function into map and apply the function to every element in the infinite fib sequence.
--Pass that infinite result to take 5 and generate the first five elements of a Fibonacci sequence,
--multiplied by five and then again by 2.

--In Haskell, f . g x is shorthand for f(g x).

