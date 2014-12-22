/* A functional language has these characteristics:

• Functional programs are made up of functions.
• A function always returns a value.
• A function, given the same inputs, will return the same values.
• Functional programs avoid changing state or mutating data.
Once you’ve set a value, you have to leave it alone.
*/

// SCALA TYPES

println("Hello, surreal World")

1 + 1

(1).+(1)

5 + 4 * 3

5.+(4.*(3))

(5).+((4).*(3))

// Everything is an object in Scala, with some small exceptions.

// STRINGS

"abc".size

// Forcing a type collision:

"abc" + 4

4 + "1.0"

// 4 * "abc"
// => ERROR

// Scala is strongly typed.
// It uses type inference.
// Unlike Ruby, Scala can do that type checking at compile time.

// ----

// EXPRESSIONS AND CONDITIONS

val a = 1
val b = 2

if(b < a){
  println("true")
} else {
  println("false")
}

// Unlike Ruby, Scala binds types at compile time.
// But unlike Java, Scala can infer the type, so you don’t have to
// type val a : Int = 1, though you can if you want.

// val is immutable; var is not

// ----

Nil
// Nil.type = List()

// if(Nil) {println("true")}
// => ERROR

// Nil is an empty list, and you can’t even test Nil or 0.
// This behavior is consistent with Scala’s strong, static typing philosophy.

// ----

// LOOPS