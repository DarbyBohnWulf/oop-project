#!/usr/bin/env ruby
require_relative 'tic_tac_toe'
require_relative 'mastermind'

module App

  module_function

  def self.start(*option)
    case option[0]
    when nil
      App.show_menu(@@main_menu)
      App.start(App.interpret_options.to_i)
    when 't', 1
      @game = TicTacToe.start
      TicTacToe.play(@game)
    when 'm', 2
      @game = Mastermind.start
      TicTacToe.play(@game)
    when 'X', 0
      exit
    else
    end
  end

  def self.interpret_options
    $stdout.puts ': '
    $stdin.gets.chomp
  end

  private
  @@options = ARGV
  @@main_menu = ['1.: TicTacToe', '2.: Mastermind', '0.: Exit', '', 'What would you like to play?']


  def self.show_menu(items)
    items.each { |m| puts m }
  end
end
