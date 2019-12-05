class Board 

  attr_accessor :grid

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, "_") }
  end
  
  def [](pos)
    row = pos[0]
    col = pos[1]
    grid[row][col]
  end

  def []=(pos,val)
    row = pos[0]
    col = pos[1]
    grid[row][col] = val
  end

  def valid?(pos) #[i,j]
    if pos[0] > grid.length || pos[1] > grid.length
      false
    else
      true
    end
    # !self[pos].nil?
  end

  def empty?(pos)
    self[pos] == "_"
  end

  def place_mark(pos, mark)
    raise "Error" unless valid?(pos) && empty?(pos)
    self[pos] = mark
  end

  def print
    grid.each {|row| puts row.join(" ")}
  end

  def win_row?(mark)
    grid.each_index {|i| return true if grid[i].all?{|el| el == mark}}
    false
  end

  def win_col?(mark)
    col = 0
    while col < grid.length
        return true if grid.map {|row| row[col] }.all? {|ele| ele == mark}
        col += 1
    end
    false
  end

  def win_diagonal?(mark)
    tl2br(mark) || bl2tr(mark)
  end

  def tl2br(mark)
    (0...grid.length).map { |i| grid[i][i] }.all? { |el| el == mark }
  end
require "byebug"
  def bl2tr(mark)
    row = grid.length #3
    (0...grid.length).map do |col| #0, 1, 2
        row -= 1 #2, 1, 0
        grid[row][col] #grid[2][0], [1][1], [2][0]
    end.all? { |el| el == mark }

    # arr = (0...grid.length).map do |i| 
    #   grid.transpose[i][i] 
    # end
    # p @grid.transpose
    # p self.grid.transpose
    # p arr
    # arr.all? { |el| el == mark }
  end

  def win?(mark) 
    win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    grid.flatten.count("_")
  end

end

# board = Board.new
# board.place_mark([1,1],:X)
# board.place_mark([2,0],:X)
# board.place_mark([0,2],:X)
# board.print
# p board.win?(:X)
# p board.empty_positions?