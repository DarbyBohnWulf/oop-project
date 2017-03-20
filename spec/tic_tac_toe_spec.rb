require 'tic_tac_toe'

describe 'TicTacToe' do
  describe '::new' do
    context 'when called'  do
      game = TicTacToe.new
      it 'has a list of players'  do
        expect(game.players).not_to be(nil)
      end

      it 'names the players'  do
        expect(game.players[:exes]).to eq('Player1')
        expect(game.players[:ohs]).to eq('Player2')
      end
    end
  end
end
