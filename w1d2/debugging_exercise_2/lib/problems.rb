# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'byebug'

def largest_prime_factor(num)
  i = num 
  
  while i >= 0 #(0..num).reverse
    #debugger
    return i if prime?(i) && num % i == 0
    i -= 1
  end
end

def prime?(num)

  #return false if num < 2 ## num < 2 return false

  (2...num).each do |i|
    return false if num % i == 0
  end

  num >= 2
end

def unique_chars?(str)
  str.each_char do |char|
    return false if str.count(char) > 1
  end
  true
end

def dupe_indices(arr)
  hash = Hash.new() { |h, k| h[k] = [] }
  arr.each_with_index do |ele, i|
    #debugger
    if arr.count(ele) > 1
      hash[ele] << i
      #debugger
    end
  end
  #debugger
  hash
end

def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    arr1.each { |ele| hash1[ele] += 1 }
    arr2.each { |ele| hash2[ele] += 1 }

    hash1 == hash2
end