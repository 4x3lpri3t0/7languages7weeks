--The three main elements of a monad were a type container, a return, and a bind.

module Main where
	data Position t = Position t deriving (Show)

	stagger (Position d) = Position (d + 2)
	crawl (Position d) = Position (d + 1)

	rtn x = x
	x >>== f = f x

	--Revised treasure map:
	treasureMap pos = pos >>==
   					  stagger >>==
					  stagger >>==
					  crawl >>==
					  rtn

--And it works:
--treasureMap (Position 0)
--Position 5