# Iterate through an array

properties = ['object oriented' , 'duck typed' , 'productive' , 'fun']

properties.each {|property| puts "Ruby is #{property}."}

# One quote around a string means the string should be interpreted literally, and two quotes leads to string evaluation

# ----

# Ruby is a pure object-oriented language

4.class
# Fixnum

4.methods
# ["inspect", "%", "<<", "singleton_method_added", "numerator", ... "*", "+", "to_i", "methods", ...]

false.class
# FalseClass
true.class
# TrueClass

# ---

x = 4
# 4

puts 'false.' unless x == 4
# nil

puts 'true.' if x == 4
# true.

if x == 4
  puts 'true.'
end
# true.

unless x == 4
  puts 'false.'
else
  puts 'true.'
end
# true.

puts 'true.' if not true
# nil

puts 'true.' if !true
# nil

# ----

x = x + 1 while x < 10
# nil

x
# 10

x = x - 1 until x == 1
# nil

x
# 1

while x < 10
  x = x + 1
  puts x
end
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

# = is for assignment and == tests for equality

# ----

# You can use values other than true and false as expressions too:
puts 'true.' if 1
# true.

puts 'true.' if 'random string'
# (irb):31: warning: string literal in condition
# true.

puts 'true.' if 0
# true.

puts 'true.' if true
# true.

puts 'true.' if false
# nil

puts 'true.' if nil
# nil

# So, everything but nil and false evaluate to true !

# ----

# The interpreter will execute code only until the value of the test is clear.
# Use & or | to compare while executing the whole expression.

true and false
# false

true or false
# true

false && false
# false

true && this_will_cause_an_error
# NameError: undefined local variable or method `this_will_cause_an_error' for main:Object from (irb):59

false && this_will_not_cause_an_error
# false

true or this_will_not_cause_an_error
# true

true || this_will_not_cause_an_error
# true

true | this_will_cause_an_error
# NameError: undefined local variable or method `this_will_cause_an_error' for main:Object from (irb):2 from :0

true | false
# true

# ----

# Duck Typing

# Ruby is strongly typed, meaning you’ll get an error when types collide.

4 + 'four'
# TypeError: String can't be coerced into Fixnum from (irb):51:in `+' from (irb):51

4.class
# Fixnum

(4.0).class
# Float

4 + 4.0
# 8.0

def add_them_up
  4 + 'four'
end

add_them_up
# TypeError: String can't be coerced into Fixnum from (irb):56:in `+' from (irb):56:in `add_them_up' from (irb):58

# So, Ruby does not do type checking until you actually try to execute code.
# This concept is called dynamic typing.
# There are disadvantages:
# You can’t catch as many errors as you can with static typing because
# compilers and tools can catch more errors with a statically typed system.

# But Ruby’s type system also has several potential advantages.
# Your classes don’t have to inherit from the same parent to be used in the same way:
i = 0
# 0

a = ['100', 100.0]
# ['100', 100.0]

while i < 2
  puts a[i].to_i
  i = i + 1
end
# 100
# 100

# You just saw duck typing in action.
# The first element of the array is a String, and the second is a Float.
# The same code converts each to an integer via to_i.

# Duck typing doesn’t care what the underlying type mightbe.
# If it walks like a duck and quacks like a duck, it’s a duck.
# In this case, the quack method is to_i.

# Duck typing is extremely important when it comes to clean objectoriented design.
# An important tenet of design philosophy is to code to interfaces rather than implementations.
# If you’re using duck typing, this philosophy is easy to support.
# If an object has push and pop methods, you can treat it like a stack.
#If it doesn’t, you can’t.

# ----

# What We Learned in Day 1

# So far, you’ve just waded through the basics.
# It’s an interpreted objectoriented language.
# Just about everything is an object, and it’s easy to get at any object’s parts, like the methods and the class.

# Ruby is duck typed, and Ruby behaves mostly like a strongly typed language.
# It’s a free-spirited language that will let you do just about anything, including changing
# core classes like NilClass and String.

# Day 1 Self-Study

# Do:

# • Print the string “Hello, world.”

# • For the string “Hello, Ruby,” find the index of the word “Ruby.”

# • Print your name ten times.

# • Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.

# • Run a Ruby program from a file.

# • Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number.
# Let a player guess the number, telling the player whether the guess is too low or too high.
# (Hint: rand(10) will generate a random number from 0 to 9, and 'gets' will read a string from the keyboard that you can translate to an integer.)
