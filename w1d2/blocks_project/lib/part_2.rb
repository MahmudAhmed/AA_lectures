def all_words_capitalized?(words)
  words.all? { |word| word == word.capitalize }
end

def no_valid_url?(arr)
  urls = ['.com', '.net', '.io', '.org']
  
  urls.each do |url|
    return arr.none? { |domain| domain.end_with?(url) }
  end

end

def any_passing_students?(arr)
  arr.any? do |hash| 
    sum = hash[:grades].sum
    avg = sum / hash[:grades].length
    avg >= 75
  end
end