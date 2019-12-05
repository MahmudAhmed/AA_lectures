class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    puts "Current player mark: #{mark} " 
    puts "Enter positions from this legal moves #{legal_positions} "
    pos = gets.chomp.split.map(&:to_i)
    until legal_positions.include?(pos) 
      puts "Invalid Positions!!!" unless legal_positions.include?(pos)
      puts "Enter positions from this legal moves #{legal_positions} "
      pos = gets.chomp.split.map(&:to_i)
      
    end
    
    pos
  end
end