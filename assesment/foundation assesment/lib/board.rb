require "byebug"
class Board
    attr_reader :size

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    def initialize(size)
        @size = size
        @grid = Array.new(size) { Array.new(size, '_') }
    end

    def [](pos)
        # debugger
        row = pos[0]
        col = pos[1]

        @grid[row][col]
    end

    def []=(pos,mark)
        row = pos[0]
        col = pos[1]

        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.each { |row| return true if row.all? { |ele| ele == mark }}
        false
    end

    def complete_col?(mark)
        (0...@grid.length).each { |i| return true if @grid.all? { |col| col[i] == mark }}
        false
    end

    def complete_diag?(mark)
        return true if (0...@grid.length).all? { |i| @grid[i][i] == mark }
        return true if (0...@grid.length).all? { |i| @grid[i][(@grid.length - 1) - i] == mark }
        false
    end

    def winner?(mark)
        complete_row?(mark) || complete_diag?(mark) || complete_col?(mark)
    end
end

# board = Board.new(3)
# p board
# p board[[1,1]] = :S
# board.print1

