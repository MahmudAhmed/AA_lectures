class MemoryGame
  attr_reader :player

  def initialize(size = 4)
    @board = Board.new(size)
    @previous_guess = nil
  end


  def play
    until board.won?
      board.render
      pos = get_player_input
      make_guess(pos)
    end

    puts "Congratulations, you win!"
  end

  def make_guess(pos)
    
  end

  

end