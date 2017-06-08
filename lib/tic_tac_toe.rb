#!/usr/bin/env ruby
require 'set'
require_relative 'player'

class TicTacToe
  attr_reader :players, :board, :marked_spaces, :won, :full

  WINNERS = [
	  Set.new([1,2,3]),
	  Set.new([4,5,6]),
	  Set.new([7,8,9]),
	  Set.new([1,4,7]),
	  Set.new([2,5,8]),
	  Set.new([3,6,9]),
	  Set.new([1,5,9]),
	  Set.new([3,5,7])
  	]

  def initialize(*names)
    self.players = {:exes => nil, :ohs => nil}
    if (names[0])
      self.players[:exes] = [Player.new(names[0]), 0, Set.new([])]
      self.players[:ohs] = [Player.new(names[1]), 0, Set.new([])]
    else
      self.players[:exes] = [Player.new, 0, Set.new]
      self.players[:ohs] = [Player.new, 0, Set.new]
    end
    self.board = [' 1 | 2 | 3 ', '___________', ' 4 | 5 | 6 ', '___________', ' 7 | 8 | 9 ']
    self.won, self.full = false, false
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
      TicTacToe.play(TicTacToe.new(name1,name2))
    else
      TicTacToe.play(TicTacToe.new)
    end
  end

  def free?(space)
    case space
    when 1..9
      if self.board.to_s.include?(space.to_s)
        true
      end
    else
      false
    end
  end

  def fill_space(team,space_number)
    replacement = team == :exes ? 'X' : 'O'
    case space_number
    when 1
      self.board[0][1] = replacement
      self.players[team][2].add space_number
    when 2
      self.board[0][5] = replacement
      self.players[team][2].add space_number
    when 3
      self.board[0][9] = replacement
      self.players[team][2].add space_number
    when 4
      self.board[2][1] = replacement
      self.players[team][2].add space_number
    when 5
      self.board[2][5] = replacement
      self.players[team][2].add space_number
    when 6
      self.board[2][9] = replacement
      self.players[team][2].add space_number
    when 7
      self.board[4][1] = replacement
      self.players[team][2].add space_number
    when 8
      self.board[4][5] = replacement
      self.players[team][2].add space_number
    when 9
      self.board[4][9] = replacement
      self.players[team][2].add space_number
    else

    end
  end

  def marked_spaces
    self.players[:exes][2] | self.players[:ohs][2]
  end

  def show_board
    App.show_menu @board
  end

  def mark_won
    self.won = true
  end

  def mark_full
    self.full = true
  end

  def over?
    self.won || self.full ? true : false
  end

  private
  attr_writer :players, :board, :won, :full

  def self.play(game)
    until game.over?
      game.players.each do |k,v|
        game.show_board
        puts 'Free spaces show numbers, mark a free space'
        space = 0
	until game.free? space
          space = v[0].make_move.to_i
        end
        game.fill_space(k,space)
        if WINNERS.any? { |w| w.subset?(v[2]) }
          game.mark_won
          v[1] += 1
        end
        if !(game.board.to_s.match? /\d/)
          game.mark_full
        end
      end
    end
  end
end
