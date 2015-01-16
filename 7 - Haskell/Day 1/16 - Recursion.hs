--The most basic building block for list construction is the : operator,
--which combines a head and tail to make a list.

--The operator in the right side is used in pattern matching as for calling a recursive function.

--Here’s : on the left side of a let:

let h:t = [1, 2, 3]

h
-- 1

t
-- [2,3]


--We can also use : to do construction, instead of deconstruction:

1:[2, 3]
--[1,2,3]

--You can't add a list to a list of integers:

[1]:[2, 3]
--ERROR

[[1],[2],[3,4]]
-- [[1],[2],[3,4]]

[1]:[]
--[[1]]

