require "byebug"
def partition(arr, num)
  n_arr = [[],[]]
  arr.each do |ele|
    if ele < num
      n_arr[0] << ele
    else
      n_arr[1] << ele
    end
  end
  n_arr
end

def merge(h1,h2)
  h1.merge(h2)
end

def censor(sent,arr)
  words = sent.split
  words.map! do |word|
    if arr.include?(word.downcase)
      word_editor(word)
    else
      word
    end
  end
  #debugger
  words.join(' ')
end

def word_editor(word)
  word.chars.map { |char| 'aeiouAEIOU'.include?(char) ? '*': char }.join('')
end 

def power_of_two?(num)
    i = 0
    while i < num
        return true if 2**i == num
        i += 1
    end 
    false
end