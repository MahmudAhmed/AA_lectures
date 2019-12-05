require "byebug"
class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end



    # return_value = [1, 2, 3].my_each do |num|
    #   puts num
    # end.my_each do |num|
    #   puts num
    # end
    # # # => 1
    # #      2
    # #      3
    # #      1
    # #      2
    # #      3

    # p return_value  # => [1, 2, 3]

  def my_select(&prc)
      arr = []
      self.my_each { |ele| arr << ele if prc.call(ele) }
      arr
  # my_each(&prc).select { |ele| prc.call(ele) }
  end

  # p a = [1, 2, 3]
  # p a.my_select { |num| num > 1 } # => [2, 3]
  # p a.my_select { |num| num == 4 } # => []


  def my_reject(&prc)
      arr = []
      self.my_each { |ele| arr << ele unless prc.call(ele) }
      arr
  end

  # a = [1, 2, 3]
  # p a.my_reject { |num| num > 1 } # => [1]
  # p a.my_reject { |num| num == 4 } # => [1, 2, 3]

  def my_any?(&prc)
      self.my_each { |ele| return true if prc.call(ele) }
      false 
  end 

  def my_all?(&prc)
      self.my_each { |ele| return false unless prc.call(ele) }
      true
  end

#   p a = [1, 2, 3]
#   p a.my_any? { |num| num > 1 } # => true
#   p a.my_any? { |num| num == 4 } # => false
#   p a.my_all? { |num| num > 1 } # => false
#   p a.my_all? { |num| num < 4 } # => true


  def my_flatten
    flatten = []
    self.my_each do |ele|
        if ele.is_a?(Array)
            flatten += ele.my_flatten 
        else
            flatten << ele
        end 
    end
    flatten 
  end

#   p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

  def my_zip(*arr)
    results = self.combination(1).to_a    
    
    (0...results.length).each do |i|
      arr.each do |row|
        results[i] << row[i]
      end
    end
    results
    
    # arr.each do |ele|
    #   results << ele
    # end
    # results.map do |ele|

  end


# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

  def my_rotate(num=1)
    arr = self.dup
    return arr if num == 0 
    # debugger 
    if num > 0
      ele = arr.shift
      arr.push(ele)
      arr.my_rotate(num-1)
    elsif num < 0
      ele = arr.pop
      arr.unshift(ele)
      arr.my_rotate(num+1)
    end 
  end

  # a = [ "a", "b", "c", "d" ]
  # p a.my_rotate         #=> ["b", "c", "d", "a"]
  # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
  # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
  # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

  def my_join(arg="")
    # results = ''
    # self.my_each{ |ele| results += ele + arg }
    # results[-1] = '' unless arg == ""
    # results
    self * arg
  end 

  # a = [ "a", "b", "c", "d" ]
  # p a.my_join         # => "abcd" 
  # p a.my_join("$")    # => "a$b$c$d"

  def my_reverse
    arr = []
    i = self.length - 1
    while i >= 0
      arr << self[i]
      i -= 1
    end
    arr
  end

  p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
  p [ 1 ].my_reverse               #=> [1]

  

end 