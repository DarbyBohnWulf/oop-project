#!/usr/bin/env ruby
require 'tic_tac_toe'

module App

  @@game = nil
  module_function

  def self.start(*option)
    case option[0]
    when nil
      App.show_menu
    when 't'
      @@game = TicTacToe.new
    when 'm'
      @@game = Mastermind.new
    when 'X'

    else
    end
  end

  private
  @@options = ARGV
  @@menu = ['1.: TicTacToe', '2.: Mastermind', '0.: Exit', '', 'What would you like to play? :']

  def self.interpret_options
  end

  def self.show_menu(*option)
    choice = 69
    while choice != 0
      @@menu.each { |m| puts m }
      if option[0]
        choice = option[0]
      end
      begin
        choice = gets.chomp.strip.to_i
      rescue Exception
        puts 'I didn\'t quite understand that, could you try again?'
      end
      case choice
      when 0
        Process.kill('KILL', Process.pid)
      end

    end
    choice
  end
end
