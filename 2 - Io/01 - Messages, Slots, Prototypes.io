# Io is a prototype language like Lua or JavaScript, meaning every object is a clone of another.

# Sending messages:

"Hi ho, Io" print

Hi ho, Io==> Hi ho, Io

# You’ re sending the print message to the string "Hi ho, Io".

# Receivers go on the left, and messages go on the right.

# ----

# You’ll create new objects by cloning existing ones:

Vehicle := Object clone

==>  Vehicle_0x24e6488:
  type             = "Vehicle"

# Object is the root-level object.

# We send the clone message, which returns a new object. We assign that object to Vehicle.

# Vehicle is not a class.
# It’s not a template used to create objects.
# It is an object, based on the Object prototype.

Vehicle description := "Something to take you places"

==> Something to take you places

# Objects have slots. Think of the collection of slots as a hash.
# We just created a slot called description.

Io> Vehicle description = "New description"
==> New description
Io> Vehicle nonexistingSlot = "This won't work"

  Exception: Slot nonexistingSlot not found. Must define slot using := operator

# ----

# You can get the value from a slot by sending the slot’s name to the object:

Io> Vehicle description
==> New description

# We can look at the names of all the slots like this:

Io> Vehicle slotNames
==> list("type", "description")

# Every object supports type:

Io> Vehicle type
==> Vehicle
Io> Object type
==> Object

# Keep in mind that a type is an object, not a class.

# Here’s what we know so far:
# • You make objects by cloning other objects.
# • Objects are collections of slots.
# • You get a slot’s value by sending the message.

# ----

# Objects, Prototypes, and Inheritance

Io> ferrari := Car clone
==> Car_0x1004f43d0:
Io> ferrari slotNames
==> list()

# A-ha! There’s no type slot. By convention, types in Io begin with uppercase
# letters. Now, when you invoke the type slot, you’ll get the type of
# your prototype:

Io> ferrari type
==> Car

# This is how Io’s object model works. Objects are just containers of slots.

# An object that begins with an uppercase name is a type, so Io sets the type slot.

# If you wanted ferrari to be a type, you would have it begin with an uppercase
# letter, like this:

Io> Ferrari := Car clone
==> Ferrari_0x9d085c8:
type = "Ferrari"

Io> Ferrari type
==> Ferrari

Io> Ferrari slotNames
==> list("type")

Io> ferrari slotNames
==> list()

# Notice that ferrari has no type slot, but Ferrari does. We’ re using a simple
# coding convention rather than a full language feature to distinguish
# between types and instances.

# In Ruby and Java, classes are templates used to create objects. bruce = Person.new
# creates a new person object from the Person class.
# They are different entities entirely, a class and an object. Not so in Io.
# bruce := Person clone creates a clone called bruce from the prototype called Person.
# Both bruce and Person are objects. Person is a type because it has a type
# slot. In most other respects, Person is identical to bruce.

# ----

# Methods

# In Io, you can create a method easily, like this:

Io> method("So, you've come for an argument." println)
==> method(
"So, you've come for an argument." println
)

# A method is an object, just like any other type of object.
# You can get its type:

Io> method() type
==> Block

# Since a method is an object, we can assign it to a slot:

Io> Car drive := method("Vroom" println)
==> method(
	"Vroom" println
)

# If a slot has a method, invoking the slot invokes the method:

Io> ferrari drive
Vroom
==> Vroom

# You can get the contents of slots, whether they are variables
# or methods, like this:

Io> ferrari getSlot("drive")
==> method(
	"Vroom" println
)

# getSlot will give you your parent’s slot if the slot doesn’t exist:

Io> ferrari getSlot("type")
==> Car

# You can get the prototype of a given object:

Io> ferrari proto
==> Car_0x100473938:
drive = method(...)
type = "Car"

Io> Car proto
==> Vehicle_0x1003b61f8:
description = "Something to take you far away"
type = "Vehicle"

# There’s a master namespace called Lobby that contains all the named
# objects:

Io> Lobby
==> Object_0x1002184e0:
Car = Car_0x100473938
Lobby = Object_0x1002184e0
Protos = Object_0x1002184e0
Vehicle = Vehicle_0x1003b61f8
exit = method(...)
ferrari = Car_0x1004f43d0
forward = method(...)

# You see the exit implementation, forward, Protos, and the stuff we defined.

# ---

# Basic ground rules:

# • Every thing is an object.

# • Every interaction with an object is a message.

# • You don’t instantiate classes; you clone other objects called prototypes.

# • Objects remember their prototypes.

# • Objects have slots.

# • Slots contain objects, including method objects.

# • A message returns the value in a slot or invokes the method in a
# slot.

# • If an object can’t respond to a message, it sends that message to
# its prototype.

# ----

# Lists

# A list is an ordered collection of objects of any type.
# List is the prototype for all lists, and
# Map is the prototype for key-value pairs, like the Ruby hash.

Io> toDos := list("find my car", "find Continuum Transfunctioner")
==> list("find my car", "find Continuum Transfunctioner")

Io> toDos size
==>2

Io> toDos append("Find a present")
==> list("find my car", "find Continuum Transfunctioner", "Find a present")

# ----

# There’s a shortcut way of representing a list.
# Object supports the list method, which wraps the arguments up into a list.

Io> list(1, 2, 3, 4)
==> list(1, 2, 3, 4)

Io> list(1, 2, 3, 4) average
==> 2.5

Io> list(1, 2, 3, 4) sum
==> 10

Io> list(1, 2, 3) at(1)
==>2

Io> list(1, 2, 3) append(4)
==> list(1, 2, 3, 4)

Io> list(1, 2, 3) pop
==>3

Io> list(1, 2, 3) prepend(0)
==> list(0, 1, 2, 3)

Io> list() isEmpty
==> true

# ----

# Maps

Io> elvis := Map clone
==> Map_0x115f580:

Io> elvis atPut("home", "Graceland")
==> Map_0x115f580:

Io> elvis at("home")
==> Graceland

Io> elvis atPut("style", "rock and roll")
==> Map_0x115f580:

Io> elvis asObject
==> Object_0x11c1d90:
home = "Graceland"
style = "rock and roll"

Io> elvis asList
==> list(list("style", "rock and roll"), list("home", "Graceland"))

Io> elvis keys
==> list("style", "home")

Io> elvis size
==>2

# A hash is a lot like an Io object in structure where
# the keys are slots that are tied to values.

# ----

# true, false, nil and singletons

Io> 4 < 5
==> true

Io> 4 <= 3
==> false

Io> true and false
==> false

Io> true and true
==> true

Io> true or true
==> true

Io> true or false
==> true

Io> 4 < 5 and 6 > 7
==> false

Io> true and 6
==> true

Io> true and 0
==> true

# 0 is true as in Ruby, not false as in C

So, what is true?

Io> true proto
==> Object_0x200490:
		= Object_()
!=  	= Object_!=()
...

Io> true clone
==> true

Io> false clone
==> false

Io> nil clone
==> nil

# true, fal se, and nil are singletons

# ----

# Singleton

# (...)

# ----

# What We Learned in Day 1

# Io prototype language has very simple syntax that you
# can use to build new basic elements of the language itself.

# Your just have to understand messages and prototypes.