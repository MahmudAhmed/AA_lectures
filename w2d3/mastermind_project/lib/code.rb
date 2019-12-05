class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end
  
  def self.random(len)
    chars = (0...len).map { |_| POSSIBLE_PEGS.keys.sample }
    Code.new(chars) #factory method
  end
  
  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end
  
  attr_reader :pegs

  def initialize(chars)
    raise "invalid pegs" unless Code.valid_pegs?(chars)
    @pegs = chars.map(&:upcase)
  end

  def [](idx)
    pegs[idx]
  end

  def length
    pegs.length
  end

  # PART 2
  def num_exact_matches(guess)
    # count = 0
    # pegs.each_with_index do |char, idx|
    #   count += 1 if guess[idx] == char
    # end
    # count
    (0...pegs.length).count {|i| guess[i] == self[i]}

  end
  require "byebug"
  def num_near_matches(guess)
    # not_exact = guess.pegs.select.with_index { |char, i| self[i] != char }
    # not_exact.count { |char| pegs.include?(char)}
    count = 0
    guess.pegs.each_with_index do |char, i|
      count += 1 if char != self[i] && pegs.include?(char)
    end
    count
  end

  def ==(guess)
    guess.pegs == pegs
  end

end
