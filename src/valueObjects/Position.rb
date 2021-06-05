require_relative '../Exceptions/OutOfBoard'
class Position

  @x_dim
  @y_dim
  def initialize(x, y, board)
    raise TypeError unless x.is_a? Integer
    raise TypeError unless y.is_a? Integer
    @x_dim,@y_dim = x,y
    is_on_board(board)
  end

  def x_dim
    @x_dim
  end

  def y_dim
    @y_dim
  end

  def is_on_board(board)
    raise TypeError unless board.is_a? GameBoard
    if @x_dim > board.x_dim || @x_dim < 0
      raise OutOfBoard, 'Ooops here is dead end, you can not go it, try other way'
    end
    if @y_dim > board.y_dim || @y_dim < 0
      raise OutOfBoard, 'Ooops here is dead end, you can not go it, try other way'
    end
  end

  private :is_on_board

end
