# frozen_string_literal: true

# Class for gameboard in the Mastermind game
class Board
  def initialize
    @attempts = []
    @tips = []
  end

  def display(try, tip)
    attempts << try
    tips << tip

    attempts.size.times do |time|
      attempt = attempts[time - 1].join ' '
      hint = tips[time - 1].join
      puts "#{attempt} | #{hint}"
    end
  end

  private

  attr_reader :attempts, :tips
end
