require_relative '../Exceptions/OutOfBoard'
class Position

  attr_reader :x_dim, :y_dim

  def initialize(x, y, board)
    raise TypeError unless x.is_a? Integer
    raise TypeError unless y.is_a? Integer

    @x_dim = x
    @y_dim = y
    on_board?(board)
  end

  def on_board?(board)
    raise TypeError unless board.is_a? GameBoard
    if @x_dim > board.x_dim || @x_dim.negative?
      raise OutOfBoard, 'Ooops here is dead end, you can not go it, try other ways'
    end

    if @y_dim > board.y_dim || @y_dim.negative?
      raise OutOfBoard, 'Ooops here is dead end, you can not go it, try other ways'
    end
  end

  private :on_board?

end
