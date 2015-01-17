--RANGES

[1..2]
--[1,2]

[1..4]
--[1,2,3,4]

--If Haskell can’t reach the endpoint with the default increment:

[10..4]
--[]

--You get empty list.

--You can specify an increment by specifying the next item in the list:

[10, 8 .. 4]
--[10,8,6,4]

[10, 9.5 .. 4]
--[10.0,9.5,9.0,8.5,8.0,7.5,7.0,6.5,6.0,5.5,5.0,4.5,4.0]


--As with Clojure, you can take some of the elements of a sequence:

take 5 [1 ..]
--[1,2,3,4,5]

take 5 [0, 2 ..]
--[0,2,4,6,8]

