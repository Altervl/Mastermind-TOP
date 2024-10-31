# frozen_string_literal: true

# Class for Codebreaker player role in the Mastermind game
class Codebreaker
  def decipher(hash)
    puts 'Enter your guess with 4 caps'
    hash.each { |k, v| print "#{k}: #{v}  " }
    puts

    guess(length)
  end

  private

  def guess(length)
    code = []
    length.times do
      input = gets.chomp.to_sym
      unless colors.keys.include? input
        puts 'Wrong color'
        redo
      end

      puts colors[input]
      code << colors[input]
    end

    puts "Your code: #{code.join(' ')}"
    code
  end
end
