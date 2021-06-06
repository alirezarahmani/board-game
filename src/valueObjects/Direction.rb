class Direction

  LEFT = 1
  RIGHT = 2
  UP = 3
  DOWN = 4
  DIRECTIONS = { left: LEFT, right: RIGHT, up: UP, down: DOWN }.freeze
  @direction = ''

  def initialize(direction)
    raise TypeError unless direction.is_a? String
    raise InvalidDirectionError, 'make sure you run, correct direction' unless DIRECTIONS.key?(direction.to_sym)

    @direction = direction
  end

  def direction
    Direction::DIRECTIONS[@direction.to_sym]
  end

end
