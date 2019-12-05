def hipsterfy(str)
    (0...str.length).reverse_each do |i|
        if "aeiou".include?(str[i])
            return str[0...i] + str[i + 1..-1]
        end
    end

    str
end

def vowel_counts(str)
    hash = Hash.new(0)
    str.downcase.each_char { |char| hash[char] += 1 if "aeiou".include?(char) }
    hash
end

def caesar_cipher(msg, n)
  alpha = ('a'..'z').to_a
  n_str = ''

  msg.each_char do |ele|
    if alpha.include?(ele)
      old_i = alpha.index(ele)
      new_i = old_i + n 
      n_str += alpha[new_i % 26]
    else
      n_str += ele
    end
  end
  n_str
end
