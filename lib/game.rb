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
    code = codemaker.cipher(colors)
    try = nil
    board.display

    until round > rounds || try == riddle
      puts "Round #{round}"
      try = codebreaker.decipher(colors)
      board.display
      check_try(code, try)
    end

    puts "Game over. Code: #{riddle.join(' ')}" if round > rounds
    puts 'Congrats, you deciphered the code!' if try == riddle
  end

  def check_try(code, try)
    white = '.'.white
    red = '.'.light_red
    overlap = code.intersection try
    tip = Array.new(overlap.size, white)

    overlap.each do |el|
      tip.unshift(red).pop if try.index(el) == code.index(el)
    end

    puts tip.join ' '
  end

  private

  attr_reader :codemaker, :codebreaker, :rounds, :colors
end
