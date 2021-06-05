require_relative '../src/valueObjects/Direction'
require_relative '../src/valueObjects/Position'
require_relative '../src/Exceptions/InvalidDirectionError'
require_relative '../src/Exceptions/OutOfBoard'
require_relative '../src/Exceptions/YouWon'
require_relative '../src/Exceptions/SnakeAttack'
require_relative '../src/Domain/GameBoard'
require_relative '../src/Domain/Player'
require_relative '../src/Domain/ArcRoom'
require_relative '../src/Domain/EmptyRoom'
require_relative '../src/Domain/EvilRoom'
require_relative '../src/Domain/SnakeRoom'
require_relative '../src/Domain/ArcEquipment'
require_relative '../src/Domain/Equipment'
require_relative '../src/Domain/Room'

def reset_board
   GameBoard.new(3,3)
end
def reset_player
  board = reset_board
   Player.new(board)
end

player = reset_player
board = reset_board

describe Direction do
  describe "add direction" do
    context "given an empty string" do
      it "throws Exception" do
        expect {Direction.new("")}.to raise_error(InvalidDirectionError)
      end
    end
    context "given correct Direction" do
      it "it should not throw exception" do
        expect(Direction.new('left').direction).to eq(1)
      end
    end
  end
end


describe Position do
  describe "add position" do
    context "given an empty string" do
      it "throws Exception" do
        expect {Position.new("", "", board)}.to raise_error(TypeError)
      end
    end
    context "check is on board" do
      it "it should throw exception" do
        expect {Position.new(8, 8, board)}.to raise_error(OutOfBoard)
      end
    end
    context "given correct Position" do
      it "it should not throw exception, x" do
        expect(Position.new(2, 3, board).x_dim).to eq(2)
      end
      it "it should not throw exception, x" do
        expect(Position.new(2, 3, board).y_dim).to eq(3)
      end
    end
  end
end

describe Player do
  describe "player check" do
    context "move player" do
      it "it should change x position of player" do
        player.move(Direction.new('right'))
        expect(player.current.x_dim).to eq(1)
      end
      it "it should throw dead end error" do
        expect {player.move(Direction.new('down'))}.to raise_error(OutOfBoard)
      end
      it "it should not change y position of player" do
        player.move(Direction.new('right'))
        expect(player.current.y_dim).to eq(0)
      end
      it "it should change y position of player" do
        player.move(Direction.new('up'))
        expect(player.current.y_dim).to eq(1)
      end
    end
    context "check equipment" do
      it "add arch equipment, should return false" do
        expect(player.has_arch).to eq(false)
      end
      it "add arch equipment, should work" do
        player.add_equipment(ArcEquipment.new)
        expect(player.has_arch).to eq(true)
      end
    end
    context "game over" do
      it "it should return false" do
        expect(player.is_game_over).to eq(false)
      end
      it "it should return true" do
        player.game_over
        expect(player.is_game_over).to eq(true)
      end
    end
  end
end

player = reset_player
describe EmptyRoom do
  describe "player reactions" do
    context "send wrong reaction" do
      it "throws Exception" do
        expect {EmptyRoom.new.player_reaction('no where', player)}.to raise_error(InvalidDirectionError)
      end
    end
    context "move player" do
      it "it should change x position of player" do
        EmptyRoom.new.player_reaction('right', player)
        expect(player.current.x_dim).to eq(1)
      end
      it "it should not change y position of player" do
        EmptyRoom.new.player_reaction('right', player)
        expect(player.current.y_dim).to eq(0)
      end
      it "it should change y position of player" do
        EmptyRoom.new.player_reaction('up', player)
        expect(player.current.y_dim).to eq(1)
      end
    end
  end
end


player = reset_player
describe SnakeRoom do
  describe "player reactions" do
    context "send wrong reaction" do
      it "throws Exception" do
        expect {SnakeRoom.new.player_reaction('no where', player)}.to raise_error(InvalidAction)
      end
    end
    context "move player" do
      it "it should change x position of player" do
        expect {SnakeRoom.new.player_reaction('attack', player)}.to raise_error(SnakeAttack)
        expect(player.current.x_dim).to eq(0)
      end
      it "it should not change y position of player" do
        expect {SnakeRoom.new.player_reaction('attack', player)}.to raise_error(SnakeAttack)
        expect(player.current.y_dim).to eq(0)
      end
    end
  end
end

player = reset_player
describe ArcRoom do
  describe "player reactions" do
    context "send wrong reaction" do
      it "throws Exception" do
        expect {ArcRoom.new.player_reaction('no where', player)}.to raise_error(InvalidAction)
      end
    end
    context "player get the equipment" do
      it "player should have arc" do
        player.move(Direction.new('right'))
        ArcRoom.new.player_reaction('take', player)
        expect(player.has_arch).to eq(true)
      end
    end
    context "player move back" do
      it "player should get back" do
        player.move(Direction.new('right'))
        ArcRoom.new.player_reaction('back', player)
        expect(player.current.x_dim).to eq(0)
      end
    end
  end
end

player = reset_player
describe EvilRoom do
  describe "player reactions" do
    context "send wrong reaction" do
      it "throws Exception" do
        expect {EvilRoom.new.player_reaction('no where', player)}.to raise_error(InvalidAction)
      end
    end
    context "attack" do
      it "the game should be over" do
        expect {EvilRoom.new.player_reaction('kill', player)}.to raise_error(GameIsOver)
      end
      it "player should win game" do
        player = reset_player
        player.add_equipment(ArcEquipment.new)
        expect {EvilRoom.new.player_reaction('kill', player)}.to raise_error(YouWon)
      end
    end
  end
end











