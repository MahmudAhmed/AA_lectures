require "byebug"

class Board 

  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, "_") }
  end
  
  def [](pos)
    row = pos[0]
    col = pos[1]
    # debugger
    self.grid[row][col]
  end

  def []=(pos,val)
    row = pos[0]
    col = pos[1]
    # debugger
    self.grid[row][col] = val
  end

  def valid?(pos) #[i,j]
    if pos[0] > self.grid.length - 1 || pos[1] > self.grid.length - 1 || pos[0] < 0 || pos[1] < 0 
      return false
    else 
      return true
    end
  end

  def empty?(pos)
    self[pos] == "_"
  end

  def place_mark(pos, mark)
    raise "Error" unless self.empty?(pos) && self.valid?(pos)
    self[pos] = mark
  end 

  def print
    self.grid.each { |row| puts row.join(" ") }
  end

  def row_win?(mark)
    self.grid.each do |row|
      return true if row.all? { |ele| ele == mark }
    end
    false
  end

  def col_win?(mark)
    # self.grid.each_index do |j|
    #   self.grid.each_index do |i|
    #     return true if self.grid.all? { |_| grid[i][j] == mark } 
    #   end
    # end
    # false

    self.grid.each_index do |i|
      return true if self.grid.all? { |row| row[i] == mark }
    end
    false
  end

  def win_diagonal?(mark)
    return true if (0...grid.length).all? { |i| grid[i][i] == mark }
    return true if (0...grid.length).all? { |i| grid[i][(grid.length-1)-i] == mark }
    false
  end

  # def left2right(mark)
  #   # i = 0
  #   # while i < self.grid.length - 1
  #   #   return false unless self.grid[i][i] == mark  
  #   #   i += 1
  #   # end
  #   # true

  #   diagnoal_eles = (0...self.grid.length).map { |i| self.grid[i][i] }
  #   diagnoal_eles.all? { |ele| ele == mark }
  # end

  # def right2left(mark)
  #   # j = 0
  #   # i = (self.grid.length - 1)
  #   # while j < self.grid.length - 1
  #   #   return false unless self.grid[i][j] == mark  
  #   #   j += 1
  #   #   i -= 1
  #   # end

  #   # true
  #   j = self.grid.length - 1
  #   diagnoal_eles = (0...self.grid.length).map do |i|
  #     self.grid[i][j-i]
  #   end
  #   diagnoal_eles.all? { |ele| ele == mark }

  #   # self.grid.each_index do |i|
  #   #   j = (self.grid.length - 1) - i
  #   #   return false unless self.grid[j][i] == mark
  #   # end
  #   # true



  # end

  def win?(mark)
    col_win?(mark) || row_win?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    self.grid.flatten.count("_") > 0
  end

end



board = Board.new
pos = [1,1]
board.place_mark(pos, :X)
board.place_mark([0,2], :X)
board.place_mark([2,0], :X)

# # pos = [1,1]
# # board.place_mark(pos, :X)
# # board.place_mark([0,0], :X)
# # board.place_mark([2,2], :X)
board.print
p board.win_diagonal?(:X)







#   def empty?(pos)
#     self[pos] == "_"
#   end

#   def place_mark(pos, mark)
#     raise "Error" unless valid?(pos) && empty?(pos)
#     self[pos] = mark
#   end

#   def print
#     grid.each {|row| puts row.join(" ")}
#   end

#   def win_row?(mark)
#     grid.each_index {|i| return true if grid[i].all?{|el| el == mark}}
#     false
#   end

#   def win_col?(mark)
#     col = 0
#     while col < grid.length
#         return true if grid.map {|row| row[col] }.all? {|ele| ele == mark}
#         col += 1
#     end
#     false
#   end

#   def win_diagonal?(mark)
#     tl2br(mark) || bl2tr(mark)
#   end

#   def tl2br(mark)
#     (0...grid.length).map { |i| grid[i][i] }.all? { |el| el == mark }
#   end
# require "byebug"
#   def bl2tr(mark)
#     row = grid.length #3
#     (0...grid.length).map do |col| #0, 1, 2
#         row -= 1 #2, 1, 0
#         grid[row][col] #grid[2][0], [1][1], [2][0]
#     end.all? { |el| el == mark }

#     # arr = (0...grid.length).map do |i| 
#     #   grid.transpose[i][i] 
#     # end
#     # p @grid.transpose
#     # p self.grid.transpose
#     # p arr
#     # arr.all? { |el| el == mark }
#   end

#   def win?(mark) 
#     win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
#   end

#   def empty_positions?
#     grid.flatten.count("_")
#   end

# end





# board.place_mark([1,1],:X)
# board.place_mark([2,0],:X)
# board.place_mark([0,2],:X)
# board.print
# p board.win?(:X)
# p board.empty_positions?