// CONCURRENCY

// The primary constructs are actors and message passing.

// Actors have pools of threads and queues.

// When you send a message to an actor (using the ! operator),
// you place an object on its queue.

// The actor reads the message and takes action.

// Often, the actor uses a pattern matcher to detect the
// message and perform the appropriate message.

import scala.actors._
import scala.actors.Actor._

case object Poke
case object Feed

class Kid() extends Actor {
  def act() {
    loop {
      react {
        case Poke => {
          println("Ow...")
          println("Quit it...")
        }
        case Feed => {
          println("Gurgle...")
          println("Burp...")
        }
      }
    }
  }
}

val bart = new Kid().start
val lisa = new Kid().start
println("Ready to poke and feed...")
bart ! Poke
lisa ! Poke
bart ! Feed
lisa ! Feed

// Kid is an actor, meaning it will run from a pool of threads
// and get messages in a queue.

// It will process each message and move on to the next.

// We start a simple loop.

// Within that is a react construct.

// react receives an actor’s messages.

// The pattern match lets us match the appropriate message,
// which will always be Poke or Feed.