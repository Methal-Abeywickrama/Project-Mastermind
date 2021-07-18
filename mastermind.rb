# frozen_string_literal: true

# main game class
class Mastermind
  attr_accessor :code, :correct_number, :matches
  attr_reader :code_maker, :code_breaker

  def initialize(maker, breaker, code)
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
    code_array = @code.split(//)
    @code_array = @code.split(//)

    @correct_number = right_numbers(code_array, input_array)

    @code_array.each_with_index do |v, i|
      @input_array.each_with_index do |e, x|
        @matches += 1 if i == x && e == v
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
