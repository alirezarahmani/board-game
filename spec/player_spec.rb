require_relative 'Base'

player = Base.new.reset_player

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











