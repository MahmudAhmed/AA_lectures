require "byebug"
class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc) #{ |acc, x| acc + x }

    if accumulator.nil?
      accumulator = self[0]
      self.drop(1).each do |ele|
        accumulator = prc.call(accumulator, ele)
      end
    else
      self.each do |ele|
        accumulator = prc.call(accumulator, ele)
      end
    end
    accumulator  

  end 
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).none? { |n| num % n == 0 }
end

def primes(num)
  return [] if num == 0
  primes = []
  i = 2
  until primes.length == num
    primes << i if is_prime?(i)
    i += 1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return 1 if num == 0

  # fact = []
  # (1..num).each do |n|
   fact = [num * factorials_rec(num-1)] 
   fact << factorials_rec(num-1)
   fact
  # # end
  # fact += fac
  # fac 
end

# p factorials_rec(6)


class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dup_idx = Hash.new { |h,k| h[k] = [] }
    self.each_with_index { |ele, i| dup_idx[ele] << i if self.count(ele) > 1 }
    dup_idx
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    (0...self.length).map do |i|
      (i+1...self.length).each do |j|
        self[i..j]
      end
    end
    # p subs
    # # subs.select { |str| str == str.reverse }

    # subs = []
    # (0...self.length).each do |i|
    #   (i+1...self.length).each do |j|
    #     subs << self[i..j]
    #   end
    # end
    # # p subs
    # subs.select { |str| str == str.reverse }
  end
end

# def substrings(str)
#   (0...str.length).map do |i|
#      (i...str.length).each { |j| str[i..j] }
#   end
# end
# p substrings('cool')
# p 'cool'.symmetric_substrings
class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)

    prc ||= Proc.new { |ele1,ele2| ele1 <=> ele2 }

    return self if count <= 1

    middle = count / 2

    left = self.take(middle)
    right = self.drop(middle)

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)

    Array.merge(sorted_left,sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty? 
      prc.call(left[0],right[0]) == -1 ? sorted << left.shift : sorted << right.shift 
    end
    sorted + left + right
  end
end


# p [3,4,2,6,5,9,1,8].merge_sort