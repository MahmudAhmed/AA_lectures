require "byebug"
def strange_sums(arr)
    combs = arr.combination(2)
    combs.count {|comb| comb.sum == 0 }
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(arr, product)
    combs = arr.combination(2)
    combs.any? do |comb|
        comb.inject {|acc, num| acc * num} == product
    end
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    n_str = ''
    str.each_char do |char|
        if hash.has_key?(char) 
            n_str += char * hash[char]
        else
            n_str += char
        end
    end
    n_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
  0.upto(num) do |n|
    return true if n * n == num
  end
  false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def anti_prime?(num) #24 => 1,2,3,4,6,8,12,24 => 8 #22 => 1,2,11,22 = > 4
  (1.upto(num-1)).none? { |n| factor_count(n) >= factor_count(num) }
end

def factor_count(num)
  (1.upto(num)).count { |n| num % n == 0 }
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


# def matrix_addition(arr1, arr2)
#     # result_arr = Array.new(arr1.length) { Array.new(arr2[0].length, 0) }
#     # debugger
#     # arr1.each_index do |j|  
#     #     arr1[j].each_index do 
#     #         result_arr[j][i] +=  arr1[j][i] + arr2[j][i]  
#     #     end
#     # end
#     # result_arr
# end

def matrix_addition(arr1, arr2)
  sum_arr = []
  arr1.each_index do |i|
    arr = [arr1[i],arr2[i]].transpose 
    arr.map! { |subArr| subArr.sum }
    #debugger
    sum_arr << arr
  end
  sum_arr
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    nums.inject(factors(nums[0])) do |acc, num|     
        factors(num).select { |el| acc.include?(el) }
    end
end

def factors(num)
    1.upto(num).select { |n| num % n == 0  }
end


# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]


def tribonacci_number(n) # [1,1,2]
  arr = [1,1,2]

  if n <= 1
    return arr[n-1]
  elsif n == 2
    return arr[n-1]
  elsif n == 3
    return arr[n-1]
  end

  (n-3).times do 
    #debugger
    arr << arr[-3..-1].sum #arr[-1] + arr[-2] + arr[-3]
  end
  arr[-1]
end
  

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274


def matrix_addition_reloaded(*arr)
    return nil if !arr.all? { |x| arr[0].length == x.length }
    sum = arr[0]
    1.upto(arr.length - 1).each do |i|
        sum = matrix_addition(sum, arr[i])
    end
    sum
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
  i = 0
  while i < arr.length
    row_ele = arr[i][0] #x
    col_ele = arr[0][i] #x
    return true if arr[i].all? { |ele| ele == row_ele }
    return true if arr.all? { |subArr| subArr[i] == col_ele }
    i += 1
  end
  false

end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(grid)
  diagnoal?(grid) || diagnoal?(grid.reverse)
end

def diagnoal?(grid)
  i = 0
  top_left = grid[0][0]

  while i < grid.length
    if grid[i][i] == top_left 
      i += 1
    else
      return false
    end
  end
  return true
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false


def pascals_triangle(num)
  if num == 1
    return [[1]]
  elsif num == 2
    return [[1], [1,1]]
  end

  tri = [[1], [1,1]]

  until tri.length == num
    tri << lower_level(tri[-1])
  end
  tri
end

def lower_level(arr) #[1,2,1] #=> [1,3,3,1]
  sum = [1]

  i = 0
  while i < arr.length - 1
    sum << arr[i] + arr[i + 1]
    i += 1
  end

  sum.push(1)
  sum
end


# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1], 
# #     [1, 2, 1], # 1 
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]

def mersenne_prime(n) #2
  m_prime = []
  num = 0
  until m_prime.length == n
    x_num = 2**num - 1 
    m_prime << x_num if prime?(x_num)
    num += 1
  end
  m_prime[-1]
end

def prime?(n)
  return false if n < 2
  (2...n).none? { |x| n % x == 0 }
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071


def triangular_word?(str)
  i = 1
  while i <= str_value(str)
    num = (i * (i + 1)) / 2
    return true if num == str_value(str)
    i += 1
  end
  return false
end

def str_value(str)
  sum = 0
  alpha = ('a'..'z').to_a
  str.each_char do |char| 
    sum += alpha.index(char) + 1
  end
  sum
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(nums)

  collapsed = false 

  while !collapsed
    collapsed = true
    idx = 0 
    while idx < nums.length
      prev_n = nums[idx] - 1
      next_n = nums[idx] + 1
      # debugger
      if  idx > 0 && (nums[idx - 1] == prev_n || nums[idx - 1] == next_n)
        collapsed = false
        nums.slice!((idx - 1)..idx)
        break
      elsif nums[idx + 1] == next_n || nums[idx + 1] == prev_n
        collapsed = false
        nums.slice!(idx..idx+1)
        break
      end
      idx += 1
    end
  end
  nums
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []



def pretentious_primes(arr, n) 
  arr.map { |ele| nth_prime(ele,n) }
end

def nth_prime(num, n) #4, 1
  prime = []
  i = 1

  if n < 0
    n *= -1
    i = -i
  end

  while prime.length < n
    num += i    
    return nil if num < 2 
    prime << num if prime?(num)
  end

  prime[-1]


  # prime = []
  # if n > 0
  #   while prime.length < n
  #     num += 1
  #     prime << num if prime?(num)
  #   end
  # else
  #   while prime.length < -n
  #     num -= 1
  #     return nil if num < 2 
  #     prime << num if prime?(num)
  #   end
  # end
  # prime[-1]
end

# p nth_prime(4,-3)

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]


def squaragonal?(grid)
  match?(grid) || match?(grid.reverse)
end


def match?(grid)
  ele = grid[0][0]
  match = false
  grid.each_with_index do |arr, i|
     if ele == arr[i]
      match = true
     else
      match = false
     end
  end
  match
end




p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false
