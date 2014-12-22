# Metaprogramming: writing programs that write programs

# Open classes

class NilClass
    def blank?
        true
    end
end

class String
    def blank?
        self.size == 0
    end
end

["", "person", nil].each do |element|
    puts element unless element.blank?
end
# => person

# Your open classes have redefined both String and Nil.
# With the kind of freedom that lets you redefine any class or object at any time,
# you can build some amazingly readable code.

# ----

# Open classes are useful when you’re building languages to encode your own domain.

# It’s often useful to express units in a language that works for your business domain.

# API that expresses all distance as inches:

class Numeric
    def inches
        self
    end
    
    def feet
        self * 12.inches
    end
    
    def yards
        self * 3.feet
    end
    
    def miles
        self * 5280.feet
    end
    
    def back
        self * -1
    end
    
    def forward
        self
    end
end

puts 10.miles.back
# => -633600
puts 2.feet.forward
# => 24

# The open classes make this kind of support possible with minimal syntax.

# ----

# Via method_missing

# Ruby calls a special debugging method each time a method is missing in order
# to print some diagnostic information.

# This behavior makes the language easier to debug.
# But sometimes, you can take advantage of this language feature to build some
# unexpectedly rich behavior.

# All you need to do is override method_missing.

# Consider an API to represent Roman numerals.
# You could do it easily enough with a method call, with an API something like
# Roman.number_for "II".

# With Ruby, we can do better:

class Roman
    def self.method_missing name, *args
        roman = name.to_s
        roman.gsub!("IV", "IIII")
        roman.gsub!("IX", "VIIII")
        roman.gsub!("XL", "XXXX")
        roman.gsub!("XC", "LXXXX")
        
        (roman.count("I") +
         roman.count("V") * 5 +
         roman.count("X") * 10 +
         roman.count("L") * 50 +
         roman.count("C") * 100)
     end
 end
 
 puts Roman.X
 puts Roman.XC
 puts Roman.XII
 puts Roman.X
 
# This code is a beautiful example of method_missing in action.

# We’ll get the name of the method and its parameters as input parameters.
# We’ re interested only in the name.
# First, we convert that to String.
# Then, we replace the special cases, like iv and ix, with strings that are easier to count.
# Then, we just count Roman digits and multiply by the value of that number.
# The API is so much easier: Roman.i versus Roman.number_for "I".

# ----

# Modules

# The most popular metaprogramming style in Ruby is the module.

# You can literally implement def or attr_accessor with a few lines of code in a module.

# You can also extend class definitions in surprising ways.

# A common technique lets you design your own domain-specific language
# (DSL) to define your class.

# The DSL defines methods in a module that adds all the methods and constants needed
# to manage a class.

# Simple program to open a CSV file based on the name of the class:

class ActsAsCsv
  def initialize
    @result = []
    read
  end

  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(', ')
    
    file.each do |row|
      @result << row.chomp.split(', ')
    end
  end
  
  def headers
    @headers
  end
  
  def csv_contents
    @result
  end
end

class RubyCsv < ActsAsCsv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect


# This basic class defines four methods:

# initialize initializes the results of the read.

# read method opens a file, reads headings, and chops them into individual fields.
# Next, it loops over lines, placing the contents of each line in an array.

# headers and csv_contents are simple accessors that return the value of instance variables.

# ----

# TODO: Review this:

# The next step is to take the file and attach that behavior to a class with
# a module method often called a macro.
# Macros change the behavior of classes, often based on changes in the environment.
# In this case, our macro opens up the class and dumps in all the behavior related to a CSV file:

class ActsAsCsv
  def self.acts_as_csv

    define_method 'read' do
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @result << row.chomp.split(', ')
      end
    end
    
    define_method "headers" do
      @headers
    end
    
    define_method "csv_contents" do
      @result
    end
    
    define_method 'initialize' do
      @result = []
      read
    end

  end
end

class RubyCsv < ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

# The metaprogramming happens in the acts_as_csv macro.
# That code calls define_method for all the methods we want to add to the target class.
# Now, when the target class calls acts_as_csv, that code will define all four methods
# on the target class.

So, the acts_as macro code does nothing but add a few methods we
could have easily added through inheritance. That design does not
seem like much of an improvement, but it’s about to get more interesting.
Let’s see how the same behavior would work in a module:

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

# Ruby will invoke the included method whenever this module gets included
# into another.

# Remember, a class is a module.
# In our included method, we extend the target class called base (which is the RubyCsv
# class), and that module adds class methods to RubyCsv. The only class
# method is acts_as_csv.

# That method in turn opens up the class and includes all the instance methods.
# And we’re writing a program that writes a program.

# The interesting thing about all these metaprogramming techniques is
# that your programs can change based on the state of your application.

# ActiveRecord uses metaprogramming to dynamically add accessors that
# are the same name as the columns of the database.

# Some XML frameworks like builder let users define custom tags with
# method_missing to provide a beautiful syntax.

# When your syntax is more beautiful, you can let the reader of your code get past
# the syntax and closer to the intentions.

# That’s the power of Ruby.

# ----

# What We Learned in Day 3

# Used Ruby to define your own syntax and change classes on the fly.
# These programming techniques fall in the category of metaprogramming.

# Every line of code that you write has two kinds of audiences: computers and people.
# Sometimes, it’s hard to strike a balance between building code that can pass
# through the interpreter or compiler and is also easy to understand.
# With metaprogramming, you can close the gap between valid Ruby syntax and sentences.

# Some of the best Ruby frameworks, such as Builder and ActiveRecord,
# heavily depend on metaprogramming techniques for readability.

# Used open classes to build a duck-typed interface supporting the blank?
# method for String objects and nil, dramatically reducing the amount of
# clutter for a common scenario.

# Used method_missing to build beautiful Roman numerals.

# Used modules to define a domain-specific language that you used to specify CSV files.

# ----

# Day 3 Self-Study

# Modify the CSV application to support an each method to return a CsvRow object.
# Use method_missing on that CsvRow to return the value for the column for a given heading.

# For example, for the file:

one, two
lions, tigers

# allow an API that works like this:

csv = RubyCsv.new
csv.each {|row| puts row.one}
# This should print "lions".

# TODO

# ----

# Many large, commercial websites use Ruby and Ruby on Rails.
# The original Twitter implementation was in Ruby, and the extraordinary
# productivity of the language allowed the website to grow to huge proportions.
# Eventually, the core of Twitter was rewritten in Scala.
# There are two lessons here.
# First, Ruby is a great language for getting a viable product to market quickly.
# Second, the scalability of Ruby is limited in some ways.

# In formal big enterprises with distributed transactions, fail-safe messaging,
# and internationalization, the role of Ruby is often seen as a
# little more limited, but Ruby can do all of these things.

# ----

# Weaknesses

# No language is perfect for all applications...

# - Performance:

# Ruby focuses on the productivity of the programmer, not optimization.

# - Concurrency and OOP:

# Object-oriented programming has a critical limitation.
# The whole premise of the model depends on wrapping behavior around state,
# and usually the state can be changed.
# This programming strategy leads to serious problems with concurrency.

# - Type Safety
# Static typing allows a whole range of tools that make it easier to do syntax trees
# and thus provide integrated development environments.
# IDEs for Ruby are more difficult to build, and so far,
# most Ruby developers do not use them.

# ----

# Final Thoughts

# So, Ruby’s core strengths are its syntax and flexibility.

# The core weaknesses are around performance, though the performance is reasonable
# for many purposes.

# All in all, Ruby is an excellent language for object oriented development.

# For the right applications, Ruby can excel.

# As with any tool, use it to solve the right set of problems, and you’re not
# likely to be disappointed.

# And keep your eyes open for a little magic along the way.