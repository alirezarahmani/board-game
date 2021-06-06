require_relative 'Base'
player = Base.new.reset_player

describe EmptyRoom do
  describe 'player reactions' do
    context 'send wrong reaction' do
      it 'throws Exception' do
        expect { EmptyRoom.new.player_reaction('no where', player) }.to raise_error(InvalidDirectionError)
      end
    end
    context 'move player' do
      it 'it should change x position of player' do
        EmptyRoom.new.player_reaction('right', player)
        expect(player.current.x_dim).to eq(1)
      end
      it 'it should not change y position of player' do
        EmptyRoom.new.player_reaction('right', player)
        expect(player.current.y_dim).to eq(0)
      end
      it 'it should change y position of player' do
        EmptyRoom.new.player_reaction('up', player)
        expect(player.current.y_dim).to eq(1)
      end
    end
  end
end


player = Base.new.reset_player
describe SnakeRoom do
  describe 'player reactions' do
    context 'send wrong reaction' do
      it 'throws Exception' do
        expect { SnakeRoom.new.player_reaction('no where', player) }.to raise_error(InvalidAction)
      end
    end
    context 'move player' do
      it 'it should change x position of player' do
        expect { SnakeRoom.new.player_reaction('attack', player) }.to raise_error(SnakeAttack)
        expect(player.current.x_dim).to eq(0)
      end
      it 'it should not change y position of player' do
        expect { SnakeRoom.new.player_reaction('attack', player) }.to raise_error(SnakeAttack)
        expect(player.current.y_dim).to eq(0)
      end
    end
  end
end

player = Base.new.reset_player
describe ArcRoom do
  describe 'player reactions' do
    context 'send wrong reaction' do
      it 'throws Exception' do
        expect { ArcRoom.new.player_reaction('no where', player) }.to raise_error(InvalidAction)
      end
    end
    context 'player get the equipment' do
      it 'player should have arc' do
        player.move(Direction.new('right'))
        ArcRoom.new.player_reaction('take', player)
        expect(player.arch?).to eq(true)
      end
    end
    context 'player move back' do
      it 'player should get back' do
        player.move(Direction.new('right'))
        ArcRoom.new.player_reaction('back', player)
        expect(player.current.x_dim).to eq(0)
      end
    end
  end
end

player = Base.new.reset_player
describe EvilRoom do
  describe 'player reactions' do
    context 'send wrong reaction' do
      it 'throws Exception' do
        expect { EvilRoom.new.player_reaction('no where', player) }.to raise_error(InvalidAction)
      end
    end
    context 'attack' do
      it 'the game should be over' do
        player = Base.new.reset_player
        expect { EvilRoom.new.player_reaction('kill', player) }.to raise_error(GameIsOver)
      end
      it 'player should win game' do
        player = Base.new.reset_player
        player.add_equipment(ArcEquipment.new)
        expect { EvilRoom.new.player_reaction('kill', player) }.to raise_error(YouWon)
      end
    end
  end
end
