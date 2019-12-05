class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    puts "Current player mark: #{mark} " 
    puts "Enter positions: "
    pos = gets.chomp.split.map(&:to_i)
    raise "Invalid Positions" unless pos.length == 2 && pos.all? {|num| num == num.to_i }
    pos
  end
end