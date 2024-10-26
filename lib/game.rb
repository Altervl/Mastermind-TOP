# frozen_string_literal: true

require_relative 'board'
require_relative 'codemaker'
require_relative 'codebreaker'

# Main class for the Mastermind game
class Game
  def initialize
    @board = Board.new
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
  end
end
