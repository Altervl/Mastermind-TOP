# frozen_string_literal: true

# Class for gameboard in the Mastermind game
class Board
  def initialize
    @attempts = []
    @tips = []
  end

  def display
    attempts.each do |attempt|
      puts attempt.join(' ')
    end

    tips.join(' ')
  end
end
