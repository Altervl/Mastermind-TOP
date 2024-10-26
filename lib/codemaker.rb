# frozen_string_literal: true

# Class for Codemaker player role in Mastermind game
class Codemaker
  def initialize(name)
    @name = name
    @colors = %w[blue yellow green purple orange]
  end

  def cipher
    code = Array.new(4)
    puts "Enter your code with 4 caps of colors:
          red, blue, yellow, green, white, orange, purple:"
    ask_colors(code)
  end

  private

  attr_reader :name, :colors

  def ask_colors(array)
    array.map do
      input = gets.chomp
      unless colors.include? input
        puts 'Wrong color'
        redo
      end

      input
    end
  end
end
