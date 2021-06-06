require_relative '../src/valueObjects/Direction'
require_relative '../src/valueObjects/Position'
require_relative '../src/Exceptions/InvalidDirectionError'
require_relative '../src/Exceptions/OutOfBoard'
require_relative '../src/Exceptions/YouWon'
require_relative '../src/Exceptions/SnakeAttack'
require_relative '../src/Domain/GameBoard'
require_relative '../src/Domain/Player'
require_relative '../src/Domain/ArcRoom'
require_relative '../src/Domain/EmptyRoom'
require_relative '../src/Domain/EvilRoom'
require_relative '../src/Domain/SnakeRoom'
require_relative '../src/Domain/ArcEquipment'
require_relative '../src/Domain/Equipment'
require_relative '../src/Domain/Room'

class Base

  def reset_board
    GameBoard.new(3, 3)
  end

  def reset_player
    board = reset_board
    Player.new(board)
  end
end
