  class Event
    MOVE = 'move'
    ADD_EQUIPMENT = 'equipment_added'
    GAME_OVER = 'game_over'
    WON = 'won'
    ATTACK_SNAKE= 'attack_snake'

    ALL_EVENTS = [MOVE, ADD_EQUIPMENT, GAME_OVER, WON, ATTACK_SNAKE]

    def dispatch(event, *payload)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
