require_relative 'Base'

board = Base.new.reset_board

describe Direction do
  describe 'add direction' do
    context 'given an empty string' do
      it 'throws Exception' do
        expect { Direction.new('') }.to raise_error(InvalidDirectionError)
      end
    end
    context 'given correct Direction' do
      it 'it should not throw exception' do
        expect(Direction.new('left').direction).to eq(1)
      end
    end
  end
end

describe Position do
  describe 'add position' do
    context 'given an empty string' do
      it 'throws Exception' do
        expect { Position.new('', '', board) }.to raise_error(TypeError)
      end
    end
    context 'check is on board' do
      it 'it should throw exception' do
        expect { Position.new(8, 8, board) }.to raise_error(OutOfBoard)
      end
    end
    context 'given correct Position' do
      it 'it should not throw exception, x' do
        expect(Position.new(2, 3, board).x_dim).to eq(2)
      end
      it 'it should not throw exception, y' do
        expect(Position.new(2, 3, board).y_dim).to eq(3)
      end
    end
  end
end
