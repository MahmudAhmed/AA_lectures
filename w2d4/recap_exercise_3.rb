require "byebug"

def no_dupes?(arr)
  arr.select { |ele| arr.count(ele) == 1 }
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []



def no_consecutive_repeats?(arr)
  (0...arr.length).all? { |i| arr[i] != arr[i+1] } 

end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  indices = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index { |char, idx| indices[char] << idx }
  indices
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  streaks = []
  i = 0
  count = 1
  while i < str.length
    if str[i] == str[i+1]
      i += 1
      count += 1
    else
    streaks << str[i] * count
    i += 1
    count = 1
    end
  end
  streaks.reverse.max { |a, b| a.length <=> b.length }

  # longest = ""
  # # streaks = ""
  # i = 0
  # count = 1
  # while i < str.length
  #   if str[i] == str[i+1]
  #     i += 1
  #     count += 1
  #   else
  #     streaks = str[i] * count
  #     longest = streaks if longest.length <= streaks.length
  #     i += 1
  #     count = 1
  #   end
  # end
  # longest
end

# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('a')           # => 'a'
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'




def bi_prime?(num) #14 = > 2 * 7 
  comb = primes(num).repeated_combination(2).to_a
  comb.any? { |pairs| pairs.inject(:*) == num }
end

def primes(num)
  primes = [2]
  i = 3
  until primes[-1] >= num
    primes << i if prime?(i)
    i += 1
  end
  primes
end

def prime?(n)
  return false if n < 2
  (2...n).none? { |x| n % x == 0 }
end
 
# p bi_prime?(22)   # => true #11 * 2 = > 22
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(14)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false



def vigenere_cipher(str, arr)
  alpha = ("a".."z").to_a
  n_str = ''
  str.each_char do |i|
    old_pos = alpha.index(i)
    new_pos = old_pos + arr[0]
    n_str += alpha[new_pos % 25]
    arr.rotate!
  end
  n_str
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str) #aeiou
  hash = {}
  str.each_char.with_index do |char, i|
    if "aeiou".include?(char)
      hash[i] = char
    end
  end
  vowel_order = hash.values.rotate(-1)
  str.each_char.with_index { |char, i| str[i] = vowel_order.shift if "aeiou".include?(char) }
  str

end



# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String
  def select(&prc)
    return "" if prc.nil?
    n_str = ''
    self.each_char do |char|
      n_str += char if prc.call(char)
    end
    n_str
  end

  def map!(&prc)
    self.each_char.with_index do |char, i|
      self[i] = prc.call(char, i)
    end
  end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


def multiply(n1,n2)
  return 0 if n2 == 0
  if n2 < 0
    -(n1 + multiply(n1, (-n2)-1))
  else
    n1 + multiply(n1, n2-1)
  end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


def lucas_sequence(n) #3
  if n == 0
    return []
  elsif n == 1
    return [2]
  elsif n == 2
    return [2,1]
  end

  debugger
  seq = lucas_sequence(n-1)
  seq << seq[-1] + seq[-2]
  seq

  

end


# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]





def prime_factorization(num) #12
  (2...num).each do |fact|
    if num % fact == 0
      other_num = num / fact
      # debugger
      return [prime_factorization(fact), prime_factorization(other_num)]
    end
  end
  [num]
end


p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
# prime_factorization(25)     # => [5, 5]
# prime_factorization(60)     # => [2, 2, 3, 5]
# prime_factorization(7)      # => [7]
# prime_factorization(11)     # => [11]
# prime_factorization(2017)   # => [2017]