# Conditionals and Loops

# WHILE

Io> i := 1
# ==> 1

Io> while(i <= 11, i println; i = i + 1); "This one goes up to 11" println

#1
#2
#...
#10
#11
#This one goes up to 11

# ----

# FOR

Io> for(i, 1, 11, i println); "This one goes up to 11" println

# ----

# And with the optional increment:

Io> for(i, 1, 11, 2, i println); "This one goes up to 11" println

#1
#3
#5
#7
#9
#11
#This one goes up to 11
#==> This one goes up to 11

# ----

# IF

if(true, "It is true.", "It is false.")

# ----

# Operators

Io> OperatorTable

# Add new Operator to OperatorTable

Io> OperatorTable addOperator("xor", 11)

Io> true xor := method(bool, if(bool, false, true))

Io> false xor := method(bool, if(bool, true, false))

Io> true xor true
==> false
Io> true xor false
==> true
Io> false xor true
==> true
Io> false xor false
==> false

# xor true gets parsed as true xor(true)

# ----

# Messages

# One of the most crucial capabilities of the language is message reflection.
# You can query any characteristic of any message and act appropriately.

# A message has three components: the sender, the target, and the arguments.

# The call method gives you access to the meta information about any message.

# ----

# (...)

# ----

# Reflection

# 
# To be continued...