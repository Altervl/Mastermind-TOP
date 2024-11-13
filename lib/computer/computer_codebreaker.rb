# frozen_string_literal: true

require 'colorize'

# Class for computer player as a codebreaker in the Mastermind game
class ComputerCodebreaker
  def initialize
    @combos = generate_combos
  end

  def decipher(colors, cue)
    guess = []
    4.times do
      sample = colors.keys.sample
      guess << colors[sample]
    end

    guess
  end

  private

  attr_reader :combos

  # Recursive method that returns all possible code combinations
  def generate_combos(colors, length, current = [], all = [])
    # Base case
    if current.size == length
      all << current.dup # save a copy of the combo
      return all # back to previous level of recursion
    end

    # Recursive case
    colors.each do |color|
      current << color
      # Call the method itself with array of colors
      generate_combos(colors, length, current, all)
      current.pop # delete last inserted color to insert next
    end

    # Return all possible combos
    all
  end
end
