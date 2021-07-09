class Mastermind
  attr_reader :code_maker, :code_breaker, :code
  attr_writer :code
  def initialize(maker,breaker,code)
    @code_maker = maker
    @code_breaker = breaker
    @code = code
  end
  def check_match(input)
    
  end
end

class CodeMaker
  attr_reader :maker_name, :input
  attr_writer :input
  def initialize(maker)
    @maker_name = maker
  end
  def declare_code
    @input = gets.chomp!.to_i
  end
end

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

puts "Hello Code Maker, whats your name"
code_maker = CodeMaker.new(gets.chomp.to_s)
puts "\n"
puts "Hello Code Breaker, whats your name"
code_breaker = CodeBreaker.new(gets.chomp.to_s)
puts "\n"

puts "#{code_maker}, write down the code \n (4 digit number)"
code_maker.declare_code
if code_maker.input == 0 || code_maker.input.to_s.length != 4
  until code_maker.input != 0 && code_maker.input.to_s.length == 4
    puts "The entered code was invalid \n Please input a 4 digit number"
    code_maker.input = gets.chomp.to_i
  end
end
game = Mastermind.new(code_maker.maker_name, code_breaker.breaker_name, code_maker.input.to_s)

puts "#{code_breaker.breaker_name}, you have 10 attempts to crack the code."
puts "enter your guess"
guess = gets.chomp.to_i
if guess == 0 || guess.to_s.length != 4
  until guess != 0 && guess.to_s.length == 4
    puts "The entered code was invalid \n Please input a 4 digit number"
    guess = gets.chomp.to_i
  end
end
code_breaker.guess(guess.to_s)

p code_breaker.the_guess
p game.code_maker
p game.code_breaker
p game.code
p code_breaker.no_1
p code_breaker.no_2
p code_breaker.no_3
p code_breaker.no_4