require 'player'

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
end
