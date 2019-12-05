# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / self.count.to_f
  end   

  def median
    return nil if self.empty?
    self.sort!
    idx = self.count / 2
    if self.count.even? #[1,2,3,4,5,6]
      num1 = self[idx]
      num2 = self[idx-1]
      sum = num1 + num2 
      sum / 2.0
    else #[1,2,3,4,5]
      self[idx]
    end
  end   

  def counts
    counter = Hash.new(0)
    self.each { |ele| counter[ele] += 1 }
    counter
  end

  def my_count(val)
    self.counts[val]
  end

  def my_index(val)
    self.each_with_index { |ele,idx| return idx if ele == val }
    nil
  end

  def my_uniq
    self.counts.keys
  end

  require "byebug"
  def my_transpose # [[1,1], [2,2]] => [[1,2], [1,2]]
    grid = Array.new(self.length) { Array.new() }
    self.each do |subArr|
      subArr.each_with_index do |ele, idx|
        #debugger
        grid[idx] << ele
      end
    end
    grid
  end
end
