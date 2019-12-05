require_relative "board.rb"
require_relative "human_player.rb"

class Game

    attr_reader :p
    attr_accessor :cur_player, :board

    def initialize(size,*p_marks)
        @size = size
        # @p1 = HumanPlayer.new(p1_mark)
        # @p2 = HumanPlayer.new(p2_mark)
        @p = p_marks.map {|mark| HumanPlayer.new(mark)}
        @cur_player = p[0]
        @board = Board.new(size)
    end

    def switch_turn
      @cur_player = p.rotate![0]
    end

    def play
      winner = false
      while board.empty_positions? > 0 && !winner
        board.print if board.empty_positions? > 0
        pos = cur_player.get_position
        board.place_mark(pos, cur_player.mark)
        if board.win?(cur_player.mark)
            puts "VICTORY, #{cur_player.mark} wins!"
            return
        else
            switch_turn
        end
      end
      puts "its a draw" if winner == false

    end
            
end