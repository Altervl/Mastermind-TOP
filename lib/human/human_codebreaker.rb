# frozen_string_literal: true

require 'colorize'

# Class for human player as a codebreaker in the Mastermind game
class HumanCodebreaker
  def decipher(colors)
    puts "Enter your guess: #{colors.each { |k, v| print "#{k}: #{v}  " }}\n"

    guess = []
    4.times do
      input = gets.chomp.to_sym
      unless colors.keys.include? input
        puts 'Wrong color'
        redo
      end

      puts colors[input]
      guess << colors[input]
    end

    guess
  end
end
