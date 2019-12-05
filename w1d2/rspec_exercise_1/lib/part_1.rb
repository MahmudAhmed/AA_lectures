require "byebug"

def average(num1,num2)
  (num1 + num2) / 2.0
end

def average_array(numbers)
  sum = numbers.sum
  sum.to_f / numbers.length
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + '!'
end

def alternating_case(sent)
  words = sent.split
  words.map!.with_index do |word, i|
    # debugger
    if i.even? 
      word.upcase
    else
      word.downcase
    end
  end
  words.join(' ')
end