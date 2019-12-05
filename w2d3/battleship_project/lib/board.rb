class Board
  
  def self.print_grid(grid)
    grid.each { |row| puts row.join(' ') } 
  end

  attr_reader :size, :grid
  
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S }
  end

  require "byebug"

  def attack(pos)
    # debugger
    if self[pos] == :S 
      self[pos] = :H
      puts "you sunk my battleship!"
      true
    else
      self[pos] = :X
      false
    end
  end

  def place_random_ships
    ships = size * 0.25
    until num_ships == ships
        pos = [rand(0...@grid.length), rand(0...@grid.length)]
        self[pos] = :S #unless self[pos] == :S
    end
  end

  def hidden_ships_grid
    #@grid.map { |row| row.each { |cell| cell == :S ? :N : cell } }
    @grid.map { |row| row.map { |cell| cell == :S ? :N : cell } }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print 
    Board.print_grid(hidden_ships_grid)
  end
end

# class Board
#   attr_reader :size, :grid
  
#   def initialize(n)
#     @grid = Array.new(n) { Array.new(n, :N) }
#     @size = n * n
#   end

#   def [](pos)
#     self.grid[pos[0]][pos[1]]
#   end

#   def []=(pos, val)
#     self.grid[pos[0]][pos[1]] = val
#   end

#   def num_ships
#     self.grid.flatten.count { |ele| ele == :S }
#   end

# require "byebug"

#   def attack(pos)
#     # debugger
#     if self[pos] == :S 
#       self[pos] = :H
#       puts "you sunk my battleship!"
#       true
#     else
#       self[pos] = :X
#       false
#     end
#   end
# end

