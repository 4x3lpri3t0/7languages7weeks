let prod x y = x * y

prod 3 4
--12

--Get the type of the function:
:t prod
--(Num a) => a -> a -> a

--Haskell uses a concept to split one function on multiple arguments into
--multiple functions, each with one argument.
--Haskell does this job with partial application.


let double = prod 2
let triple = prod 3

--We defined prod with two parameters, but we applied only the first one.

--So, computing prod 2 is easy, Just take the original function
--of prod x y = x * y, substitute 2 for x, and you have prod y = 2 * y.

double 3
--6

triple 4
--12

--When Haskell computes prod 2 4, it is really computing (prod 2) 4, like this:

--1 - apply prod 2. That returns the function (\y -> 2 * y).
--2 - apply (\y -> 2 * y) 4, or 2 * 4, giving you 8.

--That process is called currying, and just about every multiple-argument
--function in Haskell gets curried.

--That leads to greater flexibility and simpler syntax.