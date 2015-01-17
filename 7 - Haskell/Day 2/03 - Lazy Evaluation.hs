--Like Clojure’s sequence library, Haskell makes extensive use of lazy evaluation.
--With it, you can build functions that return infinite lists.

module Main where
	myRange start step = start:(myRange (start + step) step)

--We use list composition to build a list with start as the head
--and (myRange (start + step) step) as the tail.

--Successive evaluations for myRange 1 1:

--1:myRange (2 1)
--1:2:myRange (3 1)
--1:2:3:myRange (4 1)

-- ...and so on.

take 10 (myRange 10 1)
--[10,11,12,13,14,15,16,17,18,19]

take 5 (myRange 0 5)
--[0,5,10,15,20]