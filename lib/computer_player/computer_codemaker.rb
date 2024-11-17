# frozen_string_literal: true

# Class for computer player as a codemaker in the Mastermind game
class ComputerCodemaker
  def cipher(colors)
    code = []
    4.times do
      sample = colors.keys.sample
      code << colors[sample]
    end

    code
  end
end
