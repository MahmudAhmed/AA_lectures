require "byebug"

def zip(*arr)
  r_arr = Array.new(arr[0].length) { Array.new([])}
  
#debugger
  arr.each do |subArr|
    subArr.each_with_index do |ele, i|
        #debugger
      r_arr[i] << ele
    end
  end
  r_arr

  #arr.transpose
end

# ['a', 'b', 'c']
# [1, 2, 3]
# ['w', 'x', 'y']

# [['a',1, 'w'],['b',2],['c',3]]

def prizz_proc(arr, prc_1, prc_2)
    arr.select { |ele| (prc_1.call(ele) || prc_2.call(ele)) && !(prc_1.call(ele) && prc_2.call(ele))}
end

def zany_zip(*arr)
  max_len = arr.max { |a, b| a.length <=> b.length }.length 
  #why .max don't work
#debugger
  arr.each do |subArr|
    s_len = subArr.length 
    nil_times = max_len - s_len
    nil_times.times { subArr << nil }
  end
#debugger
  arr.transpose
  
end

# arr2 = [1, 2, 3] 
# arr3 = [11, 13, 15] 

# p zany_zip(arr2,arr3)

def maximum(arr, &prc)
  arr.inject do |acc, ele|
    if prc.call(ele) >= prc.call(acc)
      ele
    else
      acc
    end
  end
end

def my_group_by(arr,&prc)
  hash = Hash.new { |h,k| h[k] = [] }
  arr.each {|ele| hash[prc.call(ele)] << ele }
  hash

end

def max_tie_breaker(arr, prc1, &prc2)
  arr.inject do |acc, ele|
    if prc2.call(ele) > prc2.call(acc)
      ele
    elsif prc2.call(ele) == prc2.call(acc)
      if prc1.call(ele) > prc1.call(acc)
        ele
      else
        acc
      end
    else
      acc
    end
  end
end

def vowels_finder(word)
  # chars = word.split("")
  # first = chars.index { |char| "aeiou".include?(char)}
  # last = chars.rindex { |char| "aeiou".include?(char)}

  first = word.index(/[aeiou]/)
  last = word.rindex(/[aeiou]/)
  first..last 
end

#p vowels_finder("platnium")

def silly_syllables(sent)
  words = sent.split
      #debugger
  words.map! do |word|
    vowel_count = word.count("aeiou")
    if vowel_count >= 2
      first = word.index(/[aeiou]/)
      last = word.rindex(/[aeiou]/)
      word[first..last] 
    else
      word
    end
  end
  words.join(" ")
end

