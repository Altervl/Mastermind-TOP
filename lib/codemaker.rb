# frozen_string_literal: true

require 'colorize'

# Class for Codemaker player role in the Mastermind game
class Codemaker
  def cipher(hash)
    code = []
    4.times do
      sample = hash.keys.sample
      code << hash[sample]
    end

    code
  end

  private

  attr_reader :colors
end
