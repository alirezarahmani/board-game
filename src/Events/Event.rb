class Event
  MOVE = 'move'.freeze
  ADD_EQUIPMENT = 'equipment_added'.freeze
  GAME_OVER = 'game_over'.freeze
  WON = 'won'.freeze
  ATTACK_SNAKE = 'attack_snake'.freeze

  ALL_EVENTS = [MOVE, ADD_EQUIPMENT, GAME_OVER, WON, ATTACK_SNAKE].freeze

  def dispatch(_event, *_payload)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
