class EvilRoom < Room
  KILL = 'kill'
  RUN = 'run'

  def actions
    { KILL: 'do you want to attack to evil?', NO_ACTION: 'run?' }
  end

  def question
    'There is a Evil here what you wanna do? ' + 'run/kill'
  end

  def player_reaction(action, player)
    raise TypeError unless player.is_a? Player
    if action == KILL
      if player.has_arch
        event.dispatch(Event::WON, {'player': player, 'action': action, 'msg': 'You Won ...... !'})
      else
        event.dispatch(Event::GAME_OVER, {'player': player, 'action': action, 'msg': 'game is over'})
      end
    elsif  action == RUN
      event.dispatch(Event::MOVE, {'player': player, 'action': Direction.new('down'), 'msg': 'you are back now'})
    else
      raise InvalidAction, 'this action is not allowed, choose one of following actions in list'
    end
  end
end
