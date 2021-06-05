require_relative 'EmptyRoom'
require_relative 'SnakeRoom'
require_relative 'ArcRoom'
require_relative 'EvilRoom'
require_relative '../ValueObjects/Position'
require_relative '../Exceptions/IsOccupiedError'

class GameBoard
  @x_dim
  @y_dim
  @boarder

  def initialize(x_dim, y_dim)
    @x_dim = x_dim
    @y_dim = y_dim
    @boarder = Array.new(x_dim) { Array.new(y_dim) }
    populate_board
  end

  def x_dim
    @x_dim
  end

  def y_dim
    @y_dim
  end

  def add_room(room, position)
    raise TypeError unless position.is_a? Position
    raise IsOccupiedError unless is_not_occupied(position.x_dim, position.y_dim)
    @boarder.append([position.x_dim])
    @boarder[position.x_dim].append([position.y_dim])
    @boarder[position.x_dim][position.y_dim] = room
  end

  def room_of_cell(position)
    raise TypeError unless position.is_a? Position
    raise RoomNotExiste unless is_not_occupied(position.x_dim, position.y_dim)
    @boarder[position.x_dim][position.y_dim]
  end

  def is_not_occupied(x, y)
    if @boarder.include?(x)
      @boarder[x].include?(y) ? false : true
    else
      true
    end
  end

  def populate_board
    room_empty = EmptyRoom.new
    (0..@x_dim).each { |x|
      (0..@y_dim).each { |y|
        add_room(room_empty, Position.new(x, y, self))
      }
    }
    add_room(SnakeRoom.new, Position.new(1, 2, self ))
    add_room(ArcRoom.new, Position.new(2, 0, self))
    add_room(EvilRoom.new, Position.new(2, 2, self))
  end
  private :populate_board
end