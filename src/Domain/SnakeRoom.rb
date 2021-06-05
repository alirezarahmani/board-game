require_relative '../Exceptions/InvalidAction'
class SnakeRoom < Room
  RUN = 'run'
  ATTACK_SNAKE = 'attack'

  def actions
    {attack: 'attack to the snake?', run: 'run?'}
  end

  def question
    'there is a snake here, what you wanna do? ' + 'attack/run'
  end

  def player_reaction(action, player)
    if action == ATTACK_SNAKE
      event.dispatch(Event::ATTACK_SNAKE, {'player': player, 'action': action, 'msg': 'snake bite you, your at beginning now'})
    elsif action == RUN
      event.dispatch(Event::MOVE, {'player': player, 'action': Direction.new('down'), 'msg': 'you are back now'})
    else
      raise InvalidAction, 'this action is not allowed, choose one of following actions in list'
    end
  end
end
