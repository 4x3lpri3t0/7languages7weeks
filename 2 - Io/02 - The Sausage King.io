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

# Add Operator

Io> OperatorTable addOperator("xor", 11)

