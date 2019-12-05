require_relative "card.rb"
require "byebug"
class Board

    attr_reader :cards, :size
    attr_accessor :grid

    def initialize(size=4)
      @size = size
      @grid = Array.new(size) {Array.new(size) }
      @pairs =  ((1..(size**2)/2).to_a) * 2
      @pairs.shuffle!
      @cards = @pairs.map { |value| Card.new(value) } 

      populate
    end

    def populate
      (0...self.grid.length).each do |i|
        (0...self.grid.length).each do |j|
          pos = [i,j]
          # debugger
          self[pos] = cards.pop
        end
      end
    end


    def render
      system("clear")
      puts "  #{(0...size).to_a.join(' ')}"
      self.grid.each_with_index do |row, i|
        # puts "#{i} #{row.join(' ')}" 
        puts "#{i} #{row.map(&:to_s).join(' ')} "

      end
    end

    def won?
      self.grid.flatted.all? { |card| card.revealed? }
    end

    def reveal(pos)
      # if revealed?(pos)
      #   puts "You can't flip a card that has already been revealed."
      # else
        self[pos].reveal
      # end
      self[pos].face_value
    end

    def [](pos)
      row, col = pos
      self.grid[row][col]
    end

    def []=(pos, value)
      row, col = pos
      self.grid[row][col] = value 
    end

    def revealed?(pos)
      self[pos].revealed?
    end

end


# board = Board.new(4)
# board.render
# sleep(1)
# board.reveal([0,1])
# board.render
# sleep(1)
# board.reveal([3,1])
# board.render