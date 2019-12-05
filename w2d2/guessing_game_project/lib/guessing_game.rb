require "byebug"

class GuessingGame
  attr_accessor :num_attempts

  def initialize(min,max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def game_over?
    @game_over
  end


  def check_num(num)
    self.num_attempts += 1 #ask instructor why num_attempts == nil
    if num == @secret_num
      @game_over = true 
      print 'you win'
    elsif num > @secret_num
      print "too big"
    else
      print "too small"
    end
  end

  def ask_user
    p "enter a number"
    response = gets.chomp.to_i
    self.check_num(response)
  end   

end
