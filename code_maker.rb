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