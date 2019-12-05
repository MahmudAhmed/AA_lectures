require "byebug"

def duos(str)
  count = 0
  debugger
  str.each_char.with_index do |char, i| 
    count += 1 if str[i] == str[i+1]
  end
  count
end


p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent,hash)
  words = sent.split
  words.map! do |word|
    if hash.has_key?(word)
      word = hash[word]
    else 
      word
    end
  end
  words.join(' ')
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'


def hash_mapped(hash, prc1, &prc2)
  n_hash = {}
  hash.each do |k,v|
    n_hash[prc2.call(k)] = prc1.call(v)
  end
  n_hash

end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
  new_str = []
  str.each_char do |char|
    new_str << char if str.count(char) > 2
  end
  new_str.uniq 
  #hash.select { |h,v| v > 2 }.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
  str.each_char.with_index do |char, i|
    return true if char == str[i+1] && char == str[i+2]
  end
  false  
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
  new_str = ""
  str.each_char do |char|
    if hash.has_key?(char)
      new_str += hash[char]
    elsif char == " "  
      new_str += char
    else
      new_str += "?"
    end
  end
  new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
  new_str = ""
  i = 0
  while i < str.length
    new_str += str[i] * str[i+1].to_i
    i +=2
  end
  new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'
# require "byebug"

def conjunct_select(arr, *procs)
  procs.each do |prc|
    debugger
    arr.select! { |num| prc.call(num) }
  end
  arr
  
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
  words = sent.split
  words.map! do |word|
    if word.length < 3
      word
    elsif word.capitalize == word 
      vowel_editor(word).capitalize
    else 
      vowel_editor(word)
    end
  end
  words.join(' ')
end

def vowel_editor(word) #lenth > 3
  vowels = 'aeiouAEIOU'
  return word + "yay" if vowels.include?(word[0])
  word.each_char.with_index do |char, i| 
    return word[i..-1] + word[0...i] + "ay" if vowels.include?(char)
  end
end


# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"



def reverberate(sent)
  words = sent.split
  n_words = []
  words.each do |word| 
    if word.length < 3 
      word
    elsif word.capitalize == word
      vowels_last_edit(word).capitalize
    else
      vowels_last_edit(word)
    end
  end
  n_words * " "
end

def vowels_last_edit(word) #lenth > 3
  vowels = 'aeiouAEIOU'
  return word * 2 if vowels.include?(word[-1])
  last_v = word.rindex(/[aeiouAEIOU]/) 
  return word + word[last_v..-1]
end

# #trash => trash + ash => trashash
# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"


def disjunct_select(arr, *prcs)
  n_arr = []

  arr.each do |ele|
    prcs.each do |prc| 
      if prc.call(ele)
        n_arr << ele
        break
      end
    end
  end
  n_arr
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
  words = sent.split
  
  words.each_with_index do |word, i|
    first_idx = word.index(/[aeiou]/)
    last_idx = word.rindex(/[aeiou]/)
    if i.even? && first_idx != nil 
      word.slice!(first_idx)
    elsif last_idx != nil
      word.slice!(last_idx)
    end
  end
  words.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
  words = sent.split
  words.map! {|word| silly_word(word) }
  words.join(" ")
end

def silly_word(word)  #Italyy
  vowels = 'aeiouAEIOU'
  return word + word[-1] if vowels.include?(word[-1])
  
  n_word = ''

  word.each_char do |char| #I i 
    if vowels.include?(char)
      n_word += char + 'b' + char.downcase
    else
      n_word += char
    end
  end
  n_word
end

def compress(str) #'aabbbbc'
  n_str = ''
  
  i = 0
  while i < str.length
    counter = 1
    while str[i] == str[i+1]
      counter += 1
      i += 1
    end
    if counter > 1 
      n_str += str[i] + counter.to_s
    else
      n_str += str[i]
    end
    i += 1

  end

  n_str
end


# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"


# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

