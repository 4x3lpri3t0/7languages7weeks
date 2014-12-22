# Defining functions

def tell_the_truth
  true
end

# Every function returns something.
# If you do not specify an explicit return, the function will return the
# value of the last expression that’s processed before exiting.

# Arrays

animals = ['lions', 'tigers', 'bears']
puts animals
# lions
# tigers
# bears

animals[0]
# "lions"

animals[-1]
# "bears"

(0..1).class
# Range

animals[0..1]
# ["lions", "tigers"]

a[0] = 'zero'
a[1] = 1
a[2] = ['two', 'things']
a
# ["zero", 1, ["two", "things"]]

# ----

# You can use an array as a queue, a linked list, a stack, or a set:

a = [1]
# [1]

a.push(1)
# [1, 1]

a = [1]
# [1]

a.push(2)
# [1, 2]

a.pop
# 2

a.pop
#1

# ----

# Hashes

numbers = {1 => 'one', 2 => 'two'}
# => {1=>"one", 2=>"two"}

numbers[1]
# "one"

numbers[2]
# "two"

stuff = {:array => [1, 2, 3], :string => 'Hi dude!'}
# => {:array=>[1, 2, 3], :string=>"Hi dude!"}

stuff[:string]
=> "Hi dude!"

# A hash works a lot like an array, but instead of an integer index,
# the hash can have any arbitrary key.

# A symbol is an identifier preceded with a colon,
# like :symbol. Symbols are great for naming things.

# Although two strings with the same value can be different physical strings,
# identical symbols are the same physical object.

# You can tell by getting the unique object identifier of the symbol
# several times, like so:

'string'.object_id
# => 3092010

'string'.object_id
# 3089690

:string.object_id
# 69618

:string.object_id
# 69618

# Ruby does not support named parameters, but you can simulate them with a hash:

def tell_the_truth(options={})
    if options[:profession] == :lawyer
        'it could be believed that this is almost certainly not false.'
    else
        true
    end
end

tell_the_truth
# true

tell_the_truth :profession => :lawyer
# "it could be believed that this is almost certainly not false."

# ----

# Code Blocks and Yield

# Code block: function without a name
# You can pass it as a parameter to a function or a method

2.times {puts 'Rubies are great. Emeralds suck!'}
# Rubies are great. Emeralds suck!
# Rubies are great. Emeralds suck!

# The code between braces is called a code block.
# times is a method on Fixnum that simply does something some number of times
# You can specify code blocks with {/} or do/end

# Code blocks can take one or more parameters:

letters = ['A', 'B', 'C', 'and D']

letters.each {|a| puts a}
# A
# B
# C
# and D

# ----

# Custom implementation of the times method:

class Fixnum
    def my_times
        i = self
        while i > 0
            i = i - 1
            yield
        end
    end
end

3.my_times {puts 'ruby'}
# ruby
# ruby
# ruby

# The method called my_times loops a set number of times, invoking the code block with yield

# ----

# Blocks can also be first-class parameters:

def call_block(&block)
    block.call
end

def pass_block(&block)
    call_block(&block)
end

pass_block {puts 'Going from function to function!'}

# This technique will let you pass around executable code.

# ----

# Blocks aren’t just for iteration. In Ruby, you’ll use blocks to delay execution...

execute_at_noon { puts 'Beep beep... time to get up'}

# conditionally execute something...

in_case_of_emergency do
  use_credit_card
  panic
end

def in_case_of_emergency
  yield if emergency?
end

# enforce policy...

within_a_transaction do
  things_that
  must_happen_together
end

def within_a_transaction
  begin_transaction
  yield
  end_transaction
end

# You’ll see Ruby libraries that use blocks to process each line of a file,
# do work within an HTTP transaction, and do complex operations over collections.
# Ruby is a block party.

# ----

# Running Ruby from a File

# Create a file called hello.rb. Include any Ruby code that you’d like:
puts 'hello, world'

# Save it to your current directory, and then execute it from the command line:
batate$ ruby hello.rb
# hello, world

# ----

# Classes

# a Ruby class can inherit only one parent, called a superclass.

4.class
# Fixnum

4.class.superclass
# Integer

4.class.superclass.superclass
# Numeric

4.class.superclass.superclass.superclass
# Object

4.class.superclass.superclass.superclass.superclass
# nil

# RUBY METAMODEL:

# Object
#   |
# Module
#   |
# Class  <--  Numeric
# 		 |
# 	      Integer
# 		 |
#	      Fixnum  <--  4

# Everything eventually inherits from Object

# A Class is also a Module.
# Instances of Class serve as templates for objects.
# In our case, Fixnum is an instance of a class, and 4 is an instance of Fixnum.
# Each of these classes is also an object:

4.class.class
# Class

4.class.class.superclass
# Module

4.class.class.superclass.superclass
# Object

# So, Fixnum is derived from the class Class.
# From there, it really gets confusing.
# Class inherits from Module, and Module inherits from Object.
# Everything in Ruby has a common ancestor, Object.

# ---- 

class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby",
							[Tree.new("Reia"),
							 Tree.new("MacRuby")])

puts "Visiting a node"

ruby_tree.visit {|node| puts node.node_name}
# Ruby

puts

puts "visiting entire tree"

ruby_tree.visit_all {|node| puts node.node_name}
# Ruby
# Reia
# MacRuby

# This class Tree uses blocks and recursion to allow any user to visit all nodes in a tree.

# ----

# Writing a Mixin

# Experience has shown that multiple inheritance is complicated and problematic.
# Java uses interfaces to solve this problem. Ruby uses modules.

# A module is a collection of functions and constants

# When you include a module as part of a class,
# those behaviors and constants become part of the class.

module ToFile
  def filename
    "object_#{self.object_id}.txt"
  end
  def to_f
    File.open(filename, 'w') {|f| f.write(to_s)}
  end
end

class Person
  include ToFile
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  def to_s
    name
  end
end

Person.new('matz').to_f

# This module has two methods.
# The to_f method writes the output of the to_s method to a file
# with a filename supplied by the filename method.

#What’s interesting here is that to_s is used in the module but
# implemented in the class!
# The class has not even been defined yet.
# The module interacts with the including class at an intimate level.
# The module will often depend on several class methods.

# With Java, this contract is explicit: the class will implement a formal interface.
# With Ruby, this contract is implicit, through duck typing.

# We add the capability to add the contents to a file by mixing in the capability.

# You can use a simplified single inheritance to define the essence of a class
# and then attach additional capabilities with modules.

# This style of programming, introduced in Flavors and used in many languages
# from Smalltalk to Python, is called a mixin.

# ----

# Modules, Enumerable, and Sets

# A couple of the most critical mixins in Ruby are the
# 'enumerable' and 'comparable' mixins.

# A class wanting to be enumerable must implement each
# A class wanting to be comparable must implement <=> (spaceship operator)

# <=> is a simple comparison that returns
# -1 if b is greater
# 1 if a is greater
# and 0 otherwise

'begin' <=> 'end'
# -1

'same' <=> 'same'
0

a = [5, 3, 4, 1]
# [5, 3, 4, 1]

a.sort
# [1, 3, 4, 5]

a.any? {|i| i > 6}
# false

a.any? {|i| i > 4}
# true

a.all? {|i| i > 4}
# false

a.all? {|i| i > 0}
# true

a.collect {|i| i * 2}
# [10, 6, 8, 2]

a.select {|i| i % 2 == 0 } # even
# [4]

a.select {|i| i % 2 == 1 } # odd
# [5, 3, 1]

a.max
# 5

a.member?(2)
# false

# Since the spaceship is implemented on these integers through Fixnum,
# you can sort and compute the min or max.

# collect and map apply a function to each of the elements and
# return an array of the results.

# ----

# You can also compute the total of a list or the product with inject:

a
# [5, 3, 4, 1]

a.inject(0) {|sum, i| sum + i}
# 13

a.inject {|sum, i| sum + i}
# 13

a.inject {|product, i| product * i}
# 60

# inject takes a code block with two arguments and an expression

# The code block will be executed for each item in the list, with inject passing each list element
# to the code block as the second argument

# The first argument is the result of the previous execution of the code block

# ----

# What We Learned in Day 2

# The collections are dead simple: two collections with multiple APIs layered on top.
# Application performance is secondary. Ruby is about the performance of the programmer.

# The enumerable module gives you a flavor of just how well-designed Ruby can be.

# ----

# Day 2 Self-Study

# • Print the contents of an array of sixteen numbers, four numbers at a time, using just each.

def print_by_4(i)
    print i, ' '
    
    if i % 4 == 0
        puts
    end
end

my_array = (1..16)
my_array.each {|i| print_by_4(i)}

# Now, do the same with each_slice in Enumerable.

my_array = (1..16)
my_array.each_slice(4) {|i| p i} # p is print


# • The Tree class was interesting, but it did not allow you to specify a new tree with a clean user interface.
# Let the initializer accept a nested structure with hashes and arrays.
# You should be able to specify a tree like this:
# {’grandpa’ => {’ dad’ => {’child 1’ => {}, ’child 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }

# TODO

# • Write a simple grep that will print the lines of a file having any occurrences of a phrase anywhere in that line.
# You will need to do a simple regular expression match and read lines from a file.
# (This is surprisingly simple in Ruby.)
# If you want, include line numbers.

# TODO
