# frozen_string_literal: true

require_relative 'Room'
require_relative '../valueObjects/Direction'
# Type of room
class EmptyRoom < Room

  def question
    'nothing here, where you want to go? left/right/up/down'
  end

  def actions
    Direction::DIRECTIONS
  end

  def player_reaction(action, player)
    raise TypeError, 'player is not valid' unless player.is_a? Player
    unless action.is_a? String
      raise InvalidAction, 'this action is not allowed, choose one of following actions in list'
    end

    action = Direction.new(action)
    event.dispatch(Event::MOVE, { 'player': player, 'action': action, 'msg': 'you position is changed now!' })
  end
end
