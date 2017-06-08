require 'player'
require 'app'

describe Player do
  describe '::new' do
    context 'when called' do
      player = Player.new
      it 'gives a name'  do
        expect(player.name).to eq('Player1')
      end
    end
    context 'when provided a name' do
      player = Player.new('BeatenBobbyFlay')
      it 'takes the name'  do
        expect(player.name).to eq('BeatenBobbyFlay')
      end
    end

    context 'when there are other players' do
      it 'names them with increasing numbers' do
        player1 = Player.new
        player2 = Player.new
        expect(player2.name).to eq("Player#{Player.players.count}")
      end
    end
  end

  describe '::make_move' do
    context 'while a game is not over' do
      it 'prompts the player to make a move' do
        game = TicTacToe.new
        expect{ game.players[:exes][0].make_move }.to output.to_stdout
      end
    end
  end
end
