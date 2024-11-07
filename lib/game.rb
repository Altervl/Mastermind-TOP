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
    code = codemaker.cipher colors

    loop do
      puts "Round #{round}"
      try = codebreaker.decipher colors
      tip = check_try(code, try)
      board.display(try, tip)
      round += 1

      if round > rounds
        puts "Game over. Code: #{code.join ' '}"
        break
      end

      if try == code
        puts 'Congrats, you deciphered the code!'
        break
      end
    end
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
    tip
  end

  private

  attr_reader :board, :codemaker, :codebreaker, :rounds, :colors
end
