# frozen_string_literal: true

require 'colorize'

# Class for computer player as a codebreaker in the Mastermind game
class ComputerCodebreaker
  def decipher(colors, cue)
    guess = []
    4.times do
      sample = colors.keys.sample
      guess << colors[sample]
    end

    guess
  end
end
