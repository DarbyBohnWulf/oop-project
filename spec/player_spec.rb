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
  end
end
