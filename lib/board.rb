# frozen_string_literal: true

# Class for gameboard in the Mastermind game
class Board
  def initialize
    @attempts = []
    @cues = []
  end

  def display(try, cue)
    attempts << try
    cues << cue

    attempts.size.times do |time|
      attempt = attempts[time].join ' '
      hint = cues[time].join
      puts "#{attempt} | #{hint}"
    end
  end

  private

  attr_reader :attempts, :cues
end
