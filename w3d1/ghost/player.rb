class Player
  attr_reader :name 
  def initialize(name)
    @name = name
  end

  def guess
    puts "#{self.name} enter a char: "
    gets.chomp
  end

  def alert_invalid_guess
    puts "Entry was invalid!!!"
    puts "Entry should be 1 character, and must make a valid word."
  end


end