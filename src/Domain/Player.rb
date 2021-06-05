require_relative '../ValueObjects/Position'
require_relative '../Exceptions/AlreadyHaveArch'

class Player
  @current_position
  @board
  @is_game_over

  def initialize(board)
    raise TypeError unless board.is_a? GameBoard
    @current_position =  Position.new(0, 0, board)
    @equipments = []
    @board = board
    @is_game_over = false
  end

  def current
    @current_position
  end

  def add_equipment(equipment)
    raise TypeError unless equipment.is_a? Equipment
    unless @equipments.include? equipment
      @equipments.append(equipment)
    end
  end

  # Tell,Don't ask in OOP
  # encapsulate equipments
  #@return[Boolean]
  def has_arch
    @equipments.each do |equipment|
      if equipment.is_a? ArcEquipment
        return true
      end
    end
    false
  end

  def is_game_over
    @is_game_over
  end

  def reset_position
    @current_position =  Position.new(0, 0, board)
  end

  def move(direction)
    raise TypeError unless direction.is_a? Direction
    raise GameOverError if @is_game_over
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
    room =  @board.room_of_cell(@current_position)
    if room.is_a? ArcRoom
      if has_arch
        move_left
        raise AlreadyHaveArch 'You have been here and got the Arch, now find Evil'
      end
    end
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

  def board
    @board
  end
  private :move_left, :move_down, :move_up, :move_right

end
