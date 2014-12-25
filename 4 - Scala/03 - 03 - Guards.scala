// GUARDS

def factorial(n: Int): Int = n match {
  case 0 => 1
  case x if x > 0 => factorial(n - 1) * n
}

println(factorial(3))
// => 3 * 2 * 1 = 6

println(factorial(0))
// 1