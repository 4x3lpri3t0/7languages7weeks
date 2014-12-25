// REGEX

// The .r method on a string can translate any string to a regular expression.

// match uppercase or lowercase F at the beginning of a string:

val reg = """^(F|f)\w*""".r

println(reg.findFirstIn("Fantastic"))

println(reg.findFirstIn("not Fantastic"))

val reg = "the".r

var res = reg.findAllIn("the way the scissors trim the hair and the shrubs")

// We could iterate through the entire list of matches with foreach
res.foreach(println)