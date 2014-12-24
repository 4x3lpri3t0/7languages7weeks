import scala.collection._

class Board() {
  var positions = mutable.Buffer("_","_","_",
                                 "_","_","_",
                                 "_","_","_")

  def printBoard {
    var i = 0
    for (pos <- positions) {
      if(i % 3 == 0) {
        println
      }
      print(pos)
      i+=1
    }
    println
  }

  def changePosValue(pos: Int, value: String) {
    positions(pos) = value
  }

  def checkWin(): Boolean = {
    checkHorizontal(0) ||
    checkHorizontal(3) ||
    checkHorizontal(6) ||
    checkVertical(0) ||
    checkVertical(1) ||
    checkVertical(2) ||
    checkDiagonals
  }

  def checkHorizontal(startPos: Int): Boolean = {
    positions(startPos) != "_"                   &&
    positions(startPos) == positions(startPos+1) &&
    positions(startPos) == positions(startPos+2)
  }
  
  def checkVertical(startPos: Int): Boolean = {
    positions(startPos) != "_"                   &&
    positions(startPos) == positions(startPos+3) &&
    positions(startPos) == positions(startPos+6)
  }
  
  def checkDiagonals(): Boolean = {
    // Check if center is not "_" (so diagonal is not possible)
    positions(4) != "_"                           &&
    (
     (positions(0) == positions(4) && positions(0) == positions(8)) ||
     (positions(2) == positions(4) && positions(2) == positions(6))
    )
  }
}

class Player(val name: String, val mark: String) {
  def move: Int = {
    var input = 0
    while(input < 1 || input > 9) {
      println(name + ". Enter your next position (1-9):")
      input = Console.readLine.toInt
    }
    input
  }
}

class Game() {
  val player1 = new Player("Player 1", "X")
  val player2 = new Player("Player 2", "O")
  val players = List(player1, player2)
  var board = new Board
  var gameEnded = false

  def startGame() {
    board.printBoard

    while(!gameEnded) {
      for (player <- players) {
        if(!gameEnded) {

          // Ask player for movement
          var input = player.move

          // Update board
          input -= 1
          board.changePosValue(input, player.mark)

          // Check end of game
          gameEnded = board.checkWin()

          board.printBoard
        }
      }
    }
  }
}

var game = new Game

game.startGame