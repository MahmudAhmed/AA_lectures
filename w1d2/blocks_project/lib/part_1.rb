def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(hashes)
  hashes.reject { |hash| hash['age'] <= 2 }
   
end

def count_positive_subarrays(arr) # [[1, 2, 3], [4, 5, 6]]
    arr.count { |subarr| subarr.sum > 0 }
end

def aba_translate(word)

    new_str = ""
    
    word.each_char do |char|
        if "aeiou".include?(char)
            new_str += char + 'b' + char 
        else
            new_str += char
        end
    end

    new_str

end

def aba_array(arr)
    arr.map { |word| aba_translate(word) }
end
