def element_count(array)
    hash = Hash.new(0)
    array.each { |el| hash[el] += 1 }
    hash
end

def char_replace!(str,hash)
  str.each_char.with_index do |char, i| 
    if hash.has_key?(char)
      str[i] = hash[char]
    end
  end
  str
end

def product_inject(arr) # [ 1,2,3,4,5,6 ]
    arr.inject { |acc, n| acc * n } #[ 5,10,15,20...]
end

