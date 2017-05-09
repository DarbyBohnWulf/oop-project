require 'app'

require 'io_helpers'

RSpec.configure do |c|
  c.include IOHelpers, :input
end

describe App do

  describe '::start' do
    context 'when called' do
      it 'calls the private method App::show_menu'  do
        allow(App).to receive(:show_menu)

        App::start
        expect(App).to have_received(:show_menu)
      end
    end

    context 'when called with "t"' do
      it 'starts a game of Tic-Tac-Toe'  do
        allow(TicTacToe).to receive(:start)
        App::start('t')

        expect(TicTacToe).to have_received(:start)
      end
    end

    context 'when called with "m"' do
      it 'starts a game of Mastermind'  do
        allow(Mastermind).to receive(:start)
        App::start('m')

        expect(Mastermind).to have_received(:start)
      end
    end

    context 'when called with "X"' do
      it 'immediately exits'  do
        allow(Kernel).to receive(:exit)
        App::start('X')

        expect(Kernel).to have_received(:exit)
      end
    end
  end

  describe '::show_menu' do
    context 'when started normally' do
      it 'displays a menu'  do
        expect { App.start }.to output.to_stdout
      end
    end
  end

  describe '::interpret_options' do
    context 'when user enters input' do
      it 'returns the input', :input do
        expect(IOHelpers.simulate_stdin(1) {App.interpret_options}).to eq(1)
      end
    end
  end
end
