--A Haskell function traditionally has two parts: the type declaration and
--the function declaration.

--As with Lisp, in Haskell, let binds a variable to a function in a local scope:

let x = 10

x
--10

--When you’re coding a Haskell module, you’ll declare functions like this:

double x = x * 2

--In the console, though, we’ll use let to assign the function in local scope,
--so we can use it.

--Here’s an example of a simple double function:

let double x = x * 2

double 2
--4

