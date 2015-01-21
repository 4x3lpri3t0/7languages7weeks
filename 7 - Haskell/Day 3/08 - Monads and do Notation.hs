module Main where
	tryIO = do  putStr "Enter your name: " ;
				line <- getLine ;
				let { backwards = reverse line } ;
				return ("Hello. Your name backwards is " ++ backwards)

--Assignment uses <-. In GHCI, you must separate lines with semicolons
--and include the body of do expressions, and let expressions therein,
--within braces. If you have multiple lines, you should wrap your code in
--:{ and }: with each on a separate line.