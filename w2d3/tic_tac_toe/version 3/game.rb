require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"
require "byebug"
class Game

    attr_reader :p
    attr_accessor :cur_player, :board

    def initialize(size,hash)
        @size = size
        # @p1 = HumanPlayer.new(p1_mark)
        # @p2 = HumanPlayer.new(p2_mark)
        hash.each do |mark, computer|
          if computer
            hash[mark] = ComputerPlayer.new(mark)
          else
            hash[mark] = HumanPlayer.new(mark)
          end
        end
        @p = hash.values
        @cur_player = p[0]
        @board = Board.new(size)
    end

    def switch_turn
      self.cur_player = self.p.rotate!.first
    end

    def play
      winner = false
      while board.empty_positions? > 0 && !winner
        board.print if board.empty_positions? > 0
        legal_pos = board.legal_positions
        # debugger
        pos = cur_player.get_position(legal_pos)
        board.place_mark(pos, cur_player.mark)
        # debugger
        if board.win?(cur_player.mark)
            puts "VICTORY, #{cur_player.mark} wins!"
            winner = true
        else
            self.switch_turn
            winner = false
        end
      end
      puts "its a draw" if winner == false

    end
            
end

p machine_civil_war = Game.new(3, X: false, u: true)
p machine_civil_war.play