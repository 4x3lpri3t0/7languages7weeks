--Combine functions by chaining them together
--by passing the results of one function to another.

--Computes the second item of a list by matching the head of the tail of a list:

let second = head . tail

second [1, 2]
--2

second [3, 4, 5]
--4

--second = head . tail is equivalent to second lst = head (tail lst)