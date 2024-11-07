# frozen_string_literal: true

# Class for Codebreaker player role in the Mastermind game
class Codebreaker
  def decipher(colors)
    puts 'Enter your guess with 4 caps'
    colors.each { |k, v| print "#{k}: #{v}  " }
    puts

    guess(colors)
  end

  private

  def guess(hash)
    code = []
    4.times do
      input = gets.chomp.to_sym
      unless hash.keys.include? input
        puts 'Wrong color'
        redo
      end

      puts hash[input]
      code << hash[input]
    end

    puts "Your code: #{code.join ' '}"
    code
  end
end
