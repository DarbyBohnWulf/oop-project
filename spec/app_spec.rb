require 'app'

describe App do

  describe '::start' do
    context 'when called' do
      it 'calls the private method App::show_menu'  do
        # app = class_spy('App')
        # expect(App).to receive(:show_menu)
        allow(App).to receive(:show_menu)

        App::start
        expect(App).to have_received(:show_menu)
      end
    end

    context 'when called with "t"' do
      it 'starts a game of Tic-Tac-Toe'  do
        ttc = class_spy('TicTacToe')
        allow(ttc).to receive(:new)

        App::start('t')
        expect(ttc).to have_received(:new)
      end
    end
  end

  describe '::show_menu' do
    context 'when user chooses 1' do
      it 'starts a game of Tic-Tac-Toe'  do
        pending
      end
    end

    context 'when user chooses 2' do
      it 'starts a game of Mastermind'  do
        pending
      end
    end

    context 'when user chooses 0' do
      it 'kills its process'  do
        pending
      end
    end
  end
end
