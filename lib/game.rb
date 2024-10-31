# frozen_string_literal: true

require 'colorize'
require_relative 'board'
require_relative 'codemaker'
require_relative 'codebreaker'

# Main class for the Mastermind game
class Game
  def initialize
    @board = Board.new
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    @rounds = 12
    @colors = {
      '1': 'o'.light_blue,
      '2': 'o'.light_yellow,
      '3': 'o'.light_green,
      '4': 'o'.light_magenta,
      '5': 'o'.light_cyan,
      '6': 'o'.grey
    }
  end

  def play
    round = 1
    riddle = codemaker.cipher(colors)
    try = nil
    board.display

    until round > rounds || try == riddle
      puts "Round #{round}"
      try = codebreaker.decipher(colors)
      board.display
    end

    puts "Game over. Code: #{riddle.join(' ')}" if round > rounds
    puts 'Congrats, you deciphered the code!' if try == riddle
  end

  def cue(riddle, try)
    
  end

  private

  attr_reader :codemaker, :codebreaker, :rounds, :colors
end
