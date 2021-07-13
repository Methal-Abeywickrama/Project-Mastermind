class Mastermind
  attr_reader :code_maker, :code_breaker, :code
  attr_writer :code
  attr_accessor :correct_number, :matches
  def initialize(maker,breaker,code)
    @code_maker = maker
    @code_breaker = breaker
    @code = code
    @correct_number = 0
    @matches = 0
  end
  def check_match(input)
    @correct_number = 0
    @matches = 0
    input_array = input.split(//)
    @input_array = input.split(//)
    @input_other_array = @input_array.clone
    code_array = @code.split(//)
    @code_array = @code.split(//)
    @code_other_array = @code_array.clone

    @correct_number = right_numbers(code_array, input_array)

    # @correct_numbers = @code_other_array.select do |v|
    #   # @count = 0
    #   @input_other_array.each do |e|
    #     if v == e
    #       # @count += 1
    #       @input_other_array.delete(e)
    #       return true
    #     end
    #     puts @input_other_array
    #   end
    # end

    # @correct_number = @correct_numbers.length

    @code_array.each_with_index do |v, i|
      @input_array.each_with_index do |e, x|
        if i == x && e == v
          @matches += 1
        end

      end
    end
  end
  def right_numbers(master, guess)
    same = 0
    guess.each_index do |index|
      next unless guess[index] != '*' && master.include?(guess[index])

      same += 1
      remove = master.find_index(guess[index])
      master[remove] = '?'
      guess[index] = '?'
    end
    same
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

no_of_attempts = 10

until (game.correct_number == 4 && game.matches == 4) || no_of_attempts <= 0
  puts "#{code_breaker.breaker_name}, you have #{no_of_attempts} attempts to crack the code."
  puts "enter your guess"
  guess = gets.chomp.to_i
  if guess == 0 || guess.to_s.length != 4
    until guess != 0 && guess.to_s.length == 4
      puts "The entered code was invalid \n Please input a 4 digit number"
      guess = gets.chomp.to_i
    end
  end
  no_of_attempts -= 1
  
  # (game.correct_number != 4 && game.matches != 4) || no_of_attempts <= 0
  #   puts "#{code_breaker.breaker_name}, you have #{no_of_attempts} attempts to crack the code."
  #   puts "enter your guess"
  #   guess = gets.chomp.to_i
  #   if guess == 0 || guess.to_s.length != 4
  #     until guess != 0 && guess.to_s.length == 4
  #       puts "The entered code was invalid \n Please input a 4 digit number"
  #       guess = gets.chomp.to_i
  #     end
  #   end
  #   no_of_attempts -= 
  #   # puts game.correct_number
  #   # puts game.matches
  # end
  
  code_breaker.guess(guess.to_s)
  game.check_match(code_breaker.the_guess)
  
  # p code_breaker.the_guess
  # p game.code_maker
  # p game.code_breaker
  # p game.code
  # p code_breaker.no_1
  # p code_breaker.no_2
  # p code_breaker.no_3
  # p code_breaker.no_4
  # p game.correct_number
  # p game.matches
  
  p no_of_attempts
  p game.correct_number
  p game.matches
end