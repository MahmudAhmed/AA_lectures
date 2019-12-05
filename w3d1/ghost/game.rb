require 'set'
require_relative "./player.rb"

class Game

  attr_reader :current_player, :losses
  def initialize
    @fragment = ''
    @dictionary = Set.new
    file = File.readlines("dictionary.txt")
    file.each { |line| @dictionary.add(line.chomp) }          
    @p1 = Player.new("Player_1")
    @p2 = Player.new("Player_2") 
    @losses = { @p1 => 0, @p2 => 0 }
    @current_player = @p1
  end

  def play_round
    self.take_turn(@current_player)
    self.next_player!
    if lost?
      @losses[self.previous_player] += 1
      self.reset 
      return
    end
    self.take_turn(@current_player)
    self.next_player!
    if lost?
      @losses[self.previous_player] += 1
      self.reset 
      return
    end
  end

  def reset
    @fragment = ''
    puts "#{self.previous_player.name} gets a point!\n"
  end

  def record(player)
    num_losses = self.losses[player]
    "GHOST"[0...num_losses]
  end

  def lost?
    @dictionary.include?(@fragment)
  end


  def previous_player
    @current_player == @p1 ? @p2 : @p1
  end

  def next_player!
    @current_player == @p1 ? @current_player = @p2 : @current_player = @p1
  end

  def take_turn(player)
    puts "Current word: #{@fragment}"
    string = player.guess
    until valid_play?(string) && string.length == 1
      player.alert_invalid_guess
      string = player.guess
    end
    @fragment += string
  end

  def valid_play?(string)
    return false unless @dictionary.any? { |word| word.include?(@fragment + string) }
    true
  end

  def display_standings
    losses.keys.each { |player| print "#{player.name} => #{self.record(player)}\t" }
    puts 
  end

  def run

    until losses.has_value?(2)
      display_standings
      self.play_round
    end
    puts "#{self.previous_player.name} => #{self.record(self.previous_player)}"
    puts "Winner Found #{self.current_player.name}!!!"
  end

end

game = Game.new
game.run
