class Hangman
  attr_accessor :guess_word, :attempted_chars, :remaining_incorrect_guesses
  attr_reader :secret_word
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(self.secret_word.length, "_") 
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    self.attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    new_arr = []
    self.secret_word.each_char.with_index { |c, i| new_arr << i if c == char }
    new_arr
  end

  def fill_indices(char, arr)
    arr.each { |i| guess_word[i] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    else  
      self.attempted_chars << char
      arr = self.get_matching_indices(char)
      self.remaining_incorrect_guesses -= 1 if arr.empty?
      self.fill_indices(char, arr)
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char: "
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if guess_word.join('') == secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      p secret_word
      return true
    else
      return false
    end
  end
end

