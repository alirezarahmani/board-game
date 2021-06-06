require_relative '../ValueObjects/Position'
require_relative '../Exceptions/AlreadyHaveArch'

# Player Class
class Player
  @current_position = ''
  attr_reader :is_game_over, :board

  def initialize(board)
    raise TypeError unless board.is_a? GameBoard

    @current_position = Position.new(0, 0, board)
    @equipments = []
    @board = board
    @is_game_over = false
  end

  def current
    @current_position
  end

  def add_equipment(equipment)
    raise TypeError unless equipment.is_a? Equipment
    raise AlreadyHaveArch, 'You can not carry more th an one Arch' if arch?

    @equipments.append(equipment)
  end

  # Tell,Don't ask in OOP
  # encapsulate equipments
  # @return[Boolean]
  def arch?
    @equipments.each do |equipment|
      return true if equipment.is_a? ArcEquipment
    end
    false
  end

  def reset_position
    @current_position = Position.new(0, 0, board)
  end

  def move(direction)
    raise TypeError unless direction.is_a? Direction
    raise GameIsOver if @is_game_over

    case direction.direction
    when Direction::LEFT
      move_left
    when Direction::RIGHT
      move_right
    when Direction::UP
      move_up
    when Direction::DOWN
      move_down
    else
      raise TypeError
    end

  end

  def current_room
    @board.room_of_cell(@current_position)
  end

  def game_over
    @is_game_over = true
  end

  def move_left
    @current_position = Position.new(@current_position.x_dim - 1, @current_position.y_dim, @board)
  end

  def move_right
    @current_position = Position.new(@current_position.x_dim + 1, @current_position.y_dim, @board)
  end

  def move_up
    @current_position = Position.new(@current_position.x_dim, @current_position.y_dim + 1, @board)
  end

  def move_down
    @current_position = Position.new(@current_position.x_dim, @current_position.y_dim - 1, @board)
  end
  private :move_left, :move_down, :move_up, :move_right

end
