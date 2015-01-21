--The Problem: Drunken Pirate

--Let’s say you have a pirate making a treasure map. He’s drunk, so he
--picks up a known point and a known direction and makes his way to
--the treasure with a series of staggers and crawls.

module Main where

	stagger :: (Num t) => t -> t
	stagger d = d + 2
	crawl d = d + 1

	treasureMap d =
		crawl (
		stagger (
		stagger d))

	--Instead, we’d like a strategy that will let us chain several
	--functions together sequentially:

	--letTreasureMap (v, d) = let d1 = stagger d
	--							d2 = stagger d1
	--							d3 = crawl d2
	--						in d3



	--We want to translate stagger(crawl(x)) into stagger(x) · crawl(x),
	--where · is function composition. That’s a monad.

	