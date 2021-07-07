class Mastermind
  attr_reader :code_maker, :code_breaker, :code
  attr_writer :code
  def initialize(maker,breaker,code)
    @code_maker = maker
    @code_breaker = breaker
    @code = code
  end
end

class CodeMaker
  attr_reader :maker_name, :input
  def initialize(maker)
    @maker_name = maker
  end
  def declare_code
    @input = gets.chomp!.to_i
  end
end

class CodeBreaker
  attr_reader :breaker_name
  def initialize(breaker)
    @breaker_name = breaker
  end
  def guess(guess)
    @no_1 = guess[0]
    @no_2 = guess[1]
    @no_3 = guess[2]
    @no_4 = guess[3]
  end
end

puts "Hello Code Maker, whats your name"
code_maker = CodeMaker.new(gets.chomp.to_s)
puts "\n"
puts "Hello Code Breaker, whats your name"
code_breaker = CodeBreaker.new(gets.chomp.to_s)
puts "\n"

puts "#{code_maker}, write down the code \n (4 digit number)"
game = Mastermind.new(code_maker.maker_name, code_breaker.breaker_name, gets.chomp.to_i)

if game.code == 0
  until game.code != 0
    puts "The entered code was invalid \n Please input a 4 digit number"
    game.code = gets.chomp.to_i
  end
end

puts game.code_maker
puts game.code_breaker
puts game.code
