// LISTS

// As with most functional languages,
// the bread-and-butter data structure is the list.

List(1, 2, 3)

List("one", "two", 3)
// You get the type of Any

// Access an item of a list:
List("one", "two", 3)(2)
// List access is a function, so you use () instead of []
// Unlike Ruby, accessing an item out of range will throw an exception

// Nil in Scala is an empty list:

Nil

// ----

// SETS

// A set is like a list, but sets do not have any explicit order.

val animals = Set("lions", "tigers", "bears")

animals + "armadillos"
animals - "tigers"

// Set operations are not destructive.
// Each set operation builds a new set rather thanmodifying the old ones.
// By default, sets are inmutable

// You can’t use the + or - to combine sets, as you would in Ruby.
// In Scala, you want to use ++ and -- for set union and set difference:

animals ++ Set("whales", "raccoons")
animals -- Set("lions", "bears")

// You can also perform set intersection:
animals & Set("cats", "dogs", "lions")

// a Set is independent of order:
Set(1, 2, 3) == Set(3, 2, 1)

List(1, 2, 3) == List(3, 2, 1)

// ----

// MAPS

// key-value pair (Ruby's hash)

val ordinals = Map(0 -> "zero", 1 -> "one", 2 -> "two")

ordinals(2)
// two

// Another form of the hash map:

import scala.collection.mutable.HashMap

val map = new HashMap[Int, String]

map += 4 -> "four"
map += 8 -> "eight"
map

map += "zero" -> 0
// => ERROR

