# frozen_string_literal: true

require 'colorize'

# Class for human player as a codemaker in the Mastermind game
class HumanCodemaker
  def cipher(colors)
    puts "Enter your code: #{colors.each { |k, v| print "#{k}: #{v}  " }}\n"

    code = []
    4.times do
      input = gets.chomp.to_sym
      unless colors.keys.include? input
        puts 'Wrong input'
        redo
      end

      puts colors[input]
      code << colors[input]
    end

    code
  end
end
