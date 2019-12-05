class ComputerPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_pos)
    puts "Computers mark: #{mark} " 
    legal_pos.sample
  end
end