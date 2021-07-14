require_relative "play_module.rb"
class CodeBreaker
  include Ply
  attr_accessor :breaker_name, :no_1, :no_2, :no_3, :no_4, :the_guess
  def initialize(breaker)
    @breaker_name = breaker
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
  # def play (game)
  #   no_of_attempts = 10
  
  #   until (game.correct_number == 4 && game.matches == 4) || no_of_attempts <= 0
  #     puts "#{@breaker_name}, you have #{no_of_attempts} attempts to crack the code."
  #     puts "enter your guess"
  #     guess = gets.chomp.to_i
  #     if guess == 0 || guess.to_s.length != 4
  #       until guess != 0 && guess.to_s.length == 4
  #         puts "The entered code was invalid \n Please input a 4 digit number"
  #         guess = gets.chomp.to_i
  #       end
  #     end
  #     no_of_attempts -= 1
    
  #     self.guess(guess.to_s)
  #     game.check_match(self.the_guess)
    
    
  #     p no_of_attempts
  #     p game.correct_number
  #     p game.matches
  #   end
  # end

  def player
    puts "I play"
  end
end