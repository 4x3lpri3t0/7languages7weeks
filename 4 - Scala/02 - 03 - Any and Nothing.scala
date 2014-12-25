// Any is the root class in the Scala class hierarchy
// every Scala type will inherit from Any

// Nothing is a subtype of every type

// A function can return Nothing and conform to the return value

// ----

// HIGHER-ORDER FUNCTIONS

// A higher-order function is one that takes other functions as
// input parameters or returns functions as output.

// ----

// FOREACH

// foreach is the iteration work-horse in Scala

val list = List("frodo", "samwise", "pippin")

list.foreach(hobbit => println(hobbit))

// hobbit => println(hobbit) is an anonymous function

// ----

// MORE LIST METHODS

list

list.isEmpty
// false

Nil.isEmpty
// true

list.length
// Int = 3

list.size
// Int = 3

list.head
// frodo

list.tail
// List(samwise, pippin)

list.last
// pippin

list.init
// List(frodo, samwise)

// You can use head and tail to recurse head first,
// or last and init to recurse tail first.

list.reverse
// List(pippin, samwise, frodo)

list.drop(1)
// List(samwise, pippin)

list

list.drop(2)
// List(pippin)

// drop(n) returns the list with the first n elements removed,
// without modifying the original list

// ----

// COUNT, MAP, FILTER and others

val words = List("peg", "al", "bud", "kelly")

words.count(word => word.size > 2)
// Int = 3

words.filter(word => word.size > 2)
// List(peg, bud, kelly)

words.map(word => word.size)
// List(3, 2, 3, 5)

words.forall(word => word.size > 1)
// Boolean = true

words.exists(word => word.size > 4)
// Boolean = true

words.exists(word => word.size > 5)
// Boolean = false

// ----

// You can generalize a feature using code blocks to make something more powerful.

words.sortWith((s, t) => s.charAt(0).toLower < t.charAt(0).toLower)

// We can also use the same method to sort the list by the size of the words:

words.sortWith((s, t) => s.size < t.size)

// By using a code block, we can sort5 based on any policy that we want.

// ----

// foldLeft

// fol dLeft method in Scala is much like the inject method in Ruby.

// You’ll supply an initial value and a code block.
// foldLeft will pass to thecode block each element of the array and another value.

val list = List(1, 2, 3)

val sum = (0 /: list) {(sum, i) => sum + i}
// sum: Int = 6

/*
• We invoke the operator with a value and a code block.
The code block takes two arguments, sum and i.

• Initially, /: takes the initial value, 0, and the first element of list, 1,
and passes them into the code block. sum is 0, i is 1, and the result
of 0 + 1 is 1.

• Next, /: takes 1, the result returned from the code block, and folds
it back into the calculation as sum. So, sum is 1; i is the next element
of list, or 2; and the result of the code block is 3.

• Finally, /: takes 3, the result returned from the code block, and
folds it back into the calculation as sum. So, sum is 3; i is the next
element of list, or 3; and sum + i is 6.
*/

val list = List(1, 2, 3)

list.foldLeft(0)((sum, value) => sum + value)

// Do:

// • Use foldLeft to compute the total size of a list of strings.
val list = List("1", "22", "333", "4444")

list.foldLeft(0)((sum, word) => sum + word.size)


// • Write a Censor trait with a method that will replace the curse words
// Shoot and Darn with Pucky and Beans alternatives. Use a map to
// store the curse words and their alternatives.

// TODO

// • Load the curse words and alternatives from a file.

// TODO