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