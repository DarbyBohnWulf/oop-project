require 'app'
require 'tic_tac_toe'

require 'io_helpers'

describe 'TicTacToe' do
  describe '::new' do
    context 'when called'  do
      game = TicTacToe.new
      it 'creates a player for each side' do
        expect(game.players[:exes][0]).to be_a(Player)
        expect(game.players[:ohs][0]).to be_a(Player)
      end

      it 'has scores for the players'  do
        expect(game.players[:exes][1]).to be_an(Integer)
        expect(game.players[:ohs][1]).to be_an(Integer)
      end

      it 'has a clear game board'  do
        expect(game.board).to eq([" 1 | 2 | 3 ", "___________", " 4 | 5 | 6 ", "___________", " 7 | 8 | 9 "])
      end
    end
  end

  describe '::start' do
    context 'when called' do
      it 'offers a chance to name the players'  do
        game = nil
        IOHelpers.simulate_stdin('y', 'Tim', 'Tom') { game = TicTacToe.start }
        expect(game.players[:exes][0].name).to eq('Tim')
      end
    end
  end

  describe '#show_board' do
    context 'when called' do
      game = TicTacToe.new
      it 'displays the game grid' do
        expect { game.show_board }.to output.to_stdout
      end
    end
  end
end
