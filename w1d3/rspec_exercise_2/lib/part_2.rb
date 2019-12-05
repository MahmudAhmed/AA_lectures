def palindrome?(str)
    str == reverse(str)
end

def reverse(word)
    n_word = ''
    (word.length-1).downto(0) do |i|
        n_word += word[i]
    end
    # (0...word.length).reverse_each do |i|
    #      n_word += word[i]
    # end
    n_word
end

def substrings(str)
  arr = []
  str.each_char.with_index do |char1, idx1|
    str.each_char.with_index do |char2, idx2|
      if idx2 >= idx1
        arr << str[idx1..idx2]
      end
    end
  end
  arr
end

def palindrome_substrings(str)
  substrings(str).select { |subString| palindrome?(subString) && subString.length > 1 }
end

