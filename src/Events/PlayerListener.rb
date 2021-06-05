require_relative 'Listener'
require_relative '../Domain/ArcEquipment'
require_relative '../Exceptions/GameIsOver'
require_relative '../Exceptions/SnakeAttack'
class PlayerListener < Listener

    def public_send(event, play_load)
      raise TypeError unless Event::ALL_EVENTS.include? event.to_s
      raise TypeError unless play_load[:player].is_a? Player
      raise TypeError if play_load[:player].is_game_over
      @play_load = play_load
      @player = play_load[:player]
      fn = self.method(event)
      fn.call
    end

    def attack_snake
      @player.reset_position
      raise SnakeAttack, 'snake bite you, you are injured and you are at beginning now'
    end

    def won
      @player.game_over
      raise YouWon, 'Awesome, You Won . . .!'
    end

    def game_over
      @player.game_over
      raise GameIsOver, 'The game is over'
    end

    def move
      @player.move(@play_load[:action])
    end

    def equipment_added
      @player.add_equipment(ArcEquipment.new)
    end

    private :won, :move, :equipment_added, :game_over, :attack_snake
    @play_load
    @player

  end
