# frozen_string_literal: true

require 'colorize'

# Class for Codemaker player role in Mastermind game
class Codemaker
  def initialize(name)
    @name = name
    @colors = {
      '1': 'o'.light_blue,
      '2': 'o'.light_yellow,
      '3': 'o'.light_green,
      '4': 'o'.light_magenta,
      '5': 'o'.light_cyan,
      '6': 'o'.grey
    }
  end

  def cipher
    length = 4
    puts 'Enter your code with 4 caps'
    colors.each { |k, v| print "#{k}: #{v}  " }
    puts

    ask_code(length)
  end

  private

  attr_reader :name, :colors

  def ask_code(length)
    code = []
    length.times do
      input = gets.chomp.to_sym
      unless colors.keys.include? input
        puts 'Wrong color'
        redo
      end

      puts colors[input]
      code << colors[input]
    end

    puts "Your code: #{code.join(' ')}"
    code
  end
end
