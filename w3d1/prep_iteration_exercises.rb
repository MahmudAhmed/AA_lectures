# ### Factors
#
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  (1..num).select { |n| num % n == 0 }
end

# p factors(12)

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&prc)
    sorted = false
    while !sorted
      sorted = true
      (0...self.length - 1).each do |i|
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    arr = self.dup
    sorted = false
    while !sorted
      sorted = true
      (0...arr.length - 1).each do |i|
        if prc.call(arr[i], arr[i+1]) == 1
          arr[i], arr[i+1] = arr[i+1], arr[i]
          sorted = false
        end
      end
    end
    arr
  end
end


# arr = [1, 3, 2,  5]
# # arr.bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# # arr.bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# # p arr

# p arr.bubble_sort { |num1, num2| num1 <=> num2 } #sort ascending
# # arr.bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# p arr


# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

    def subwords(word, dictionary)
      dictionary.include?(word)
    end

def substrings(string)
  arr = []
  string.each_char.with_index do |char1, idx1|
    string.each_char.with_index do |char2, idx2|
      arr << string[idx1..idx2] if idx2 >= idx1 && subwords(string[idx1..idx2], DICTIONARY)
    end
  end
  arr
end
DICTIONARY = ["cat", "at"]

#  p substrings("cat") 
# => ["c", "ca", "cat", "a", "at", "t"]`.


# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
  array.map { |num| num * 2 }
end

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.
require "byebug"
class Array
  def my_map(&prc)
    arr = []
    self.my_each { |ele| arr << prc.call(ele) }
    arr
  end

  def my_select(&prc)
    arr = []
    self.my_each { |ele| arr << ele if prc.call(ele) }
    arr
  end
 
  def my_inject(&blk)
    results = self[0]
    # debugger
    (1...self.length).to_a.my_each do |i| 
      results = blk.call(results,self[i])
    end
    results

    # self.my_each do |i| 
    #   results += blk.call(results,self[i])
    # end
    # results
  end
end

# p [1,2,3].my_inject { |acc, num| acc * num } 

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
  strings.my_inject { |n_str, char| n_str + char }
end

# p concatenate(["Yay ", "for ", "strings!"])