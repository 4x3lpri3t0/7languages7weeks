-- USER-DEFINED TYPES

-- We can define our own data types with the data keyword.

--data Boolean = True | False

--That means that the type Boolean will have a single value, either True or False.

--Simplified deck of cards, with two suits and five ranks:

module Main where

	--The console doesn’t know how to show these values.
	--There’s a shorthand way to derive the 'show' function as you declare user-defined data types:
	data Suit = Spades | Hearts deriving (Show)
	data Rank = Ten | Jack | Queen | King | Ace deriving (Show)

	--Suit and Rank are 'type constructors'.

	type Card = (Rank, Suit)
	type Hand = [Card]

	--Card is a tuple with a rank and a suit.
	--Hand is a list of cards.

	value :: Rank -> Integer
	value Ten = 1
	value Jack = 2
	value Queen = 3
	value King = 4
	value Ace = 5

	cardValue :: Card -> Integer
	cardValue (rank, suit) = value rank