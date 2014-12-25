def double(x:Int):Int = x * 2

double(4)

// Scala can often infer the return type.

// You can also specify a method definition in block form:

def double(x:Int):Int = {
  x * 2
}

double(6)

// That = after the Int return type is mandatory

// ----

// var vs val

// In Scala, immutable means using val instead of var:

var mutable = "I am mutabel"

mutable = "Touch me, change me..."

val inmutable = "I am not mutable"

// immutable = "Can't touch this"
// => ERROR

