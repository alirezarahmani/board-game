require_relative '../Exceptions/InvalidAction'
class ArcRoom < Room
  TAKE = 'take'
  NO_ACTION = 'back'

  def actions
    {TAKE: 'take it?', NO_ACTION: 'NOT NOW'}
  end

  def question
    'will you take arch, you need it to kill evil?' + ' ' + TAKE + '/' + NO_ACTION
  end

  def player_reaction(action, player)
    if action == TAKE
      event.dispatch(Event::ADD_EQUIPMENT, {'player': player, 'action': action})
      event.dispatch(Event::MOVE, {'player': player, 'action': Direction.new('left'), 'msg': 'you got Arch, now go and kill evil ' + ' You are back now'})
    elsif action == NO_ACTION
      event.dispatch(Event::MOVE, {'player': player, 'action': Direction.new('left'), 'msg': 'You are back now'})
    else
      raise InvalidAction, 'this action is not allowed, choose one of following actions in list'
    end
  end
end
