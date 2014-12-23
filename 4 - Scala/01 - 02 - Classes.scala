// Class with just attributes
class Person(firstName: String, lastName: String)

val gump = new Person("Forrest", "Gump")

// data + behavior
class Compass {
	val directions = List("north", "east", "south", "west")
	var bearing = 0
	print("Initial bearing: ")
	println(direction)

	def direction() = directions(bearing)

	def inform(turnDirection: String) {
		println("Turning " + turnDirection + ". Now bearing " + direction)
	}

	def turnRight() {
		bearing = (bearing + 1) % directions.size
		inform("right")
	}

	def turnLeft() {
		bearing = (bearing + (directions.size - 1)) % directions.size
		inform("left")
	}
}

val myCompass = new Compass

myCompass.turnRight
myCompass.turnRight

myCompass.turnLeft
myCompass.turnLeft
myCompass.turnLeft

// ----

// AUXILIARY CONSTRUCTORS

// class with two constructors:

class Person(first_name: String) {
	println("Outer constructor")
	def this(first_name: String, last_name: String) {
		this(first_name)
		println("Inner constructor")
	}
	def talk() = println("Hi")
}

val bob = new Person("Bob")
val bobTate = new Person("Bob", "Tate")

// ----

// EXTENDING CLASSES

// Companion Objects and Class Methods

// When there's something that can have only one instance,
// you’ll define it with the object keyword instead of the class keyword:

object TrueRing {
	def rule = println("To rule them all")
}

TrueRing.rule

// The TrueRing definition works exactly like any class definition (static),
// but it creates a singleton object.

// In Scala, you can have both an object definition and a class
// definition with the same name.

// Using this scenario, you can create class methods
// within the singleton object declaration and instance methods
// within the class declaration.

// In our example, the method rule is a class method.
// This strategy is called companion objects.

// ----

// INHERITANCE

class Person(val name: String) {
	def talk(message: String) = println(name + " says " + message)
	def id(): String = name
}

class Employee(override val name: String,
						val number: Int) extends Person(name) {
	override def talk(message: String) {
		println(name + " with number "  + number + " says " + message)
	}
	override def id():String = number.toString
}

val employee = new Employee("Yoda", 4)
employee.talk("Extend or extend not. There is no try.")

// TRAITS

