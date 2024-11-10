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
    @rounds = 10
    @colors = {
      '1': 'o'.light_blue,  '2': 'o'.light_yellow,
      '3': 'o'.light_green, '4': 'o'.light_magenta,
      '5': 'o'.light_cyan,  '6': 'o'.grey
    }
  end

  def play
    round = 1
    code = codemaker.cipher colors

    loop do
      if round > rounds
        puts "Game over. Code: #{code.join ' '}"
        break
      end

      try = codebreaker.decipher colors

      tip = check_try(code, try)
      board.display(try, tip)
      round += 1

      if try == code
        puts 'Congrats, you deciphered the code!'
        break
      end
    end
  end

  def check_try(code, try)
    # Variables for hint about the decipher try
    hint = []

    # Argument copies for changing
    code_copy = code.dup
    try_copy = try.dup

    # Check for exact matches
    try_copy.each_with_index do |el, i|
      next unless el == code_copy[i]

      hint << '.'.light_red

      # Remove element from later checks
      code_copy[i] = nil
      try_copy[i] = nil
    end

    # Check for color existence
    try_copy.compact.each do |el|
      if code_copy.include?(el)
        hint << '.'.white
        code_copy[code_copy.index(el)] = nil # Убираем этот цвет из дальнейших проверок
      end
    end

    hint
  end

  private

  attr_reader :board, :codemaker, :codebreaker, :rounds, :colors
end
