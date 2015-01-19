--You can also have types that are recursive.

--Think about a tree.
--In our tree, the values are on the leaf nodes.
--A node, then, is either a leaf or a list of trees.

module Main where
	data Tree a = Children [Tree a] | Leaf a deriving (Show)

--We have one type constructor, Tree.
--We also have two data constructors, Children and Leaf.
--We can use all of those together to represent trees:

let leaf = Leaf 1

leaf
-- Leaf 1

--We build a tree having a single leaf.
--We assign the new leaf to a variable.
--The only job of the data constructor Leaf is to hold the values together with the type.
--We can access each piece through pattern matching:

let (Leaf value) = leaf

value
-- 1

--Some more complex trees:

Children[Leaf 1, Leaf 2]
-- Children [Leaf 1,Leaf 2]

let tree = Children[Leaf 1, Children [Leaf 2, Leaf 3]]

tree
-- Children [Leaf 1,Children [Leaf 2,Leaf 3]]

--The definition is recursive.
--So we can go as deep as we need through let and pattern matching to pick off each piece.

let (Children ch) = tree

ch
--[Leaf 1,Children [Leaf 2,Leaf 3]]

let (fst:tail) = ch

fst
--Leaf 1

----

--Let’s look at a function to determine the depth of a tree:

depth (Leaf _) = 1
depth (Children c) = 1 + maximum (map depth c)

--First pattern:
--If it’s a leaf, regardless of the content of the leaf, the depth of the tree is one.

--Second pattern:
--If we call depth on Children, we add one to maximum (map depth c).
--The function maximum computes the maximum element in an array.
-- map depth c will compute a list of the depths of all the children.

--See how we use the data constructors to help us match the exact
--pieces of the data structure that will help us do the job.