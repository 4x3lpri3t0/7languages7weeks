--Haskell depends on tail-recursion optimization to efficiently deal with recursion.

module Main where
	fib :: Integer -> Integer
	fib 0 = 1
	fib 1 = 1
	fib x = fib (x - 1) + fib (x - 2)

--That solution is inefficient (not tail-recursive).