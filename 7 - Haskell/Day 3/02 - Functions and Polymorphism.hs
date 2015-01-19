--Simple function:

backwards [] = []
backwards (h:t) = backwards t ++ [h]

--We could add a type to that function that looks like this:

backwards :: Hand -> Hand

--That would restrict the backwards function to working with only one
--kind of list, a list of cards. What we really want is this:

backwards :: [a] -> [a]
backwards [] = []
backwards (h:t) = backwards t ++ [h]

--Now, the function is polymorphic.
--[a] means we can use a list of any type.

--If you start with a list of Integers, this function will return a list of Integers.

----

--Here’s a polymorphic data type that builds a three-tuple having three points of the same type:

-- go to => triplet.hs