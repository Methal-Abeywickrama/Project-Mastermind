require_relative "play_module.rb"
class CodeBreaker
  include Ply
  attr_accessor :breaker_name, :no_1, :no_2, :no_3, :no_4, :the_guess
  def initialize(breaker)
    @breaker_name = breaker
    @available_numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @attempt = []
  end
  def guess(guess)
    @no_1 = guess[0]
    @no_2 = guess[1]
    @no_3 = guess[2]
    @no_4 = guess[3]
    @the_guess = guess
  end
  def computer_guess
    rand(1000..9999)
  end

  def player
    puts "I play"
  end

  def player_plays
    gets.chomp.to_i
  end

  def computer_plays (correct_numbers, matches)
    if correct_numbers == 0
      @available_numbers.delete(correct_numbers[0])
      @available_numbers.delete(correct_numbers[1])
      @available_numbers.delete(correct_numbers[2])
      @available_numbers.delete(correct_numbers[3])
    end
    if correct_numbers == 4
      @available_numbers = correct_numbers.split(//)
    end
    @available_numbers.shuffle!
    @attempt = @available_numbers[0..3].join("").to_i

    
  end
end