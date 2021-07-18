# frozen_string_literal: true

# Universal code maker class
class CodeMaker
  attr_accessor :input
  attr_reader :maker_name

  def initialize(maker)
    @maker_name = maker
  end

  def declare_code
    @input = gets.chomp!.to_i
  end

  def computer_code
    @input = rand(1000..9999)
  end
end
