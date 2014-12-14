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