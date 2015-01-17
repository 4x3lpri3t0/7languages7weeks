--ANONYMOUS FUNCTIONS

(\x -> x) "Logical."
--"Logical."

(\x -> x ++ " captain.") "Logical,"
--"Logical, captain."

----

--MAP and WHERE

map (\x -> x * x) [1, 2, 3]

--or:
module Main where
	squareAll list = map square list
	where square x = x * x

--1 - squareAll: takes a parameter called list.
--2 - map: apply a function called square to all the items in list.
--3 - where: declare a local version of square.


--You can also use map with part of a function, called a section:
map (+ 1) [1, 2, 3]

--(+ 1) is actually a partially applied function.
--The + function takes two parameters, and we’ve supplied only one.
--The result is that we get a function like (x + 1), with a single parameter x.

----

--FILTER

odd 5
--True

filter odd [1, 2, 3, 4, 5]
--[1,3,5]

----

--FOLDL

foldl (\x carryOver -> carryOver + x) 0 [1 .. 10]
--55

--We took an initial carry-over value of 0 and then applied the function to
--every item in the list, using the result of the function as the carryOver
--argument and each item of the list as the other.

--Folding with an operator:
foldl1 (+) [1 .. 3]
--6