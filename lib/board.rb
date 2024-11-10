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

    attempts.size.times do |t|
      attempt = attempts[t].join ' '
      hint = cues[t].join
      puts "Round #{t + 1} | Try: #{attempt} | Hint: #{hint}"
      puts '–' * 35
    end
  end

  private

  attr_reader :attempts, :cues
end
