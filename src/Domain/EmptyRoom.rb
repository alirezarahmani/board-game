require_relative 'Room'
require_relative '../valueObjects/Direction'
class EmptyRoom < Room

    def question
      'nothing here, where you want to go? ' + 'left/right/up/down'
    end

    def actions
      Direction::DIRECTIONS
    end

    def player_reaction(action, player)
      raise TypeError, 'player is not valid' unless player.is_a? Player
      raise InvalidAction, 'this action is not allowed, choose one of following actions in list' unless action.is_a? String
      action = Direction.new(action)
      event.dispatch(Event::MOVE, {'player': player, 'action': action, 'msg': 'you position is changed now!'})
    end
end