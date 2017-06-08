require 'app'
require 'tic_tac_toe'

require 'io_helpers'

describe 'TicTacToe' do
  before(:example) do
    @game = TicTacToe.new
  end
  describe '::new' do
    context 'when called'  do
      it 'creates a player for each side' do
        expect(@game.players[:exes][0]).to be_a(Player)
        expect(@game.players[:ohs][0]).to be_a(Player)
      end

      it 'has scores for the players'  do
        expect(@game.players[:exes][1]).to be_an(Integer)
        expect(@game.players[:ohs][1]).to be_an(Integer)
      end

      it 'has a clear game board'  do
        expect(@game.board).to eq([" 1 | 2 | 3 ", "___________", " 4 | 5 | 6 ", "___________", " 7 | 8 | 9 "])
      end

      it 'is not over' do
        expect(@game.over?).to eq(false)
      end
    end
  end

  describe '#show_board' do
    context 'when called' do
      it 'displays the game grid' do
        expect { @game.show_board }.to output.to_stdout
      end
    end
  end

  describe '#free?' do
    context'when called on space number' do
      it 'indicates if the space is filled' do
        expect(@game.free?(5)).to eq(true)
      end
    end
  end

  describe '#fill_space' do
    context 'when player chooses a free space' do
      it 'updates the @board accordingly' do
        @game.fill_space(:exes, 1)

        expect(@game.board).to eq([" X | 2 | 3 ", "___________", " 4 | 5 | 6 ", "___________", " 7 | 8 | 9 "])
        expect(@game.players[:exes][2]).to eq(Set.new [1])
        expect(@game.marked_spaces).to eq(Set.new [1])
      end
    end
  end

  describe '#over?' do
    context 'when the game has been won' do
      it 'marks the game as over' do
	allow(@game).to receive(:won).and_return(true)
	
        expect(@game.over?).to be(true)
      end
    end
    context 'when the board has been filled' do
      it 'marks the game as over' do
	allow(@game).to receive(:full).and_return(true)
	
        expect(@game.over?).to be(true)
      end
    end
  end
end
