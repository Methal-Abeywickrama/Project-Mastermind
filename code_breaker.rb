class CodeBreaker
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
end