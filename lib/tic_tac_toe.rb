#!/usr/bin/env ruby
require_relative 'player'

class TicTacToe
  attr_reader :players, :board

  def initialize(*names)
    self.board = [' 1 | 2 | 3 ', '___________', ' 4 | 5 | 6 ', '___________', ' 7 | 8 | 9 ']
    self.players = {:exes => nil, :ohs => nil}
    if (names[0])
      self.players[:exes] = [Player.new(names[0]), 0]
      self.players[:ohs] = [Player.new(names[1]), 0]
    else
      self.players[:exes] = [Player.new, 0]
      self.players[:ohs] = [Player.new, 0]
    end
  end

  def self.start
    puts 'Would you like to name the players?'
    choice = App.interpret_options
    case choice
    when 'y', 'Y', 'yes'
      puts 'Player 1?'
      name1 = App.interpret_options
      puts 'Player 2?'
      name2 = App.interpret_options
      TicTacToe.new(name1,name2)
    else
      TicTacToe.new
    end
  end

  def show_board
    App.show_menu @board
  end

  private
  attr_writer :players, :board

end
