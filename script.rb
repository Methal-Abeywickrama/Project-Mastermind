require_relative "code_breaker.rb"
require_relative "code_maker.rb"
require_relative "mastermind.rb"

def user_input
  gets.chomp.to_i
end

puts "Hello, are you gonna \n 1.make \n 2.break the code today"
choice = gets.chomp.to_i
if choice != 1 && choice != 2
  until choice == 1 || choice == 2
    puts "Please enter 1 for make or 2 for break"
    choice = gets.chomp.to_i
  end
end


if choice == 1
  
  puts "Hello Code Maker, whats your name"
  code_maker = CodeMaker.new(gets.chomp.to_s)
  puts "\n"
  puts "#{code_maker.maker_name}, write down the code \n (4 digit number)"
  
  code_maker.declare_code
  if code_maker.input == 0 || code_maker.input.to_s.length != 4
    until code_maker.input != 0 && code_maker.input.to_s.length == 4
      puts "The entered code was invalid \n Please input a 4 digit number"
      code_maker.input = user_input
    end
  end
  
else 
  code_maker = CodeMaker.new("Computer")
  code_maker.computer_code
end

if choice == 2
  
  puts "Hello Code Breaker, whats your name"
  code_breaker = CodeBreaker.new(gets.chomp.to_s)
  puts "\n"
else
  code_breaker = CodeBreaker.new("Computer")
end

game = Mastermind.new(code_maker.maker_name, code_breaker.breaker_name, code_maker.input.to_s)

if choice == 2 
  code_breaker.play(game, "human")
end

if choice == 1
  code_breaker.play(game, "computer")
end

