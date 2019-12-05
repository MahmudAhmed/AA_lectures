def proper_factors(num)
  1.upto(num-1).select { |n| num % n == 0 }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(n) #3
  arr = []
  i = 1
  until arr.length == n 
    arr << i if perfect_number?(i)
    i += 1
  end
  arr
end