require 'set'
require_relative "./player.rb"
require "byebug"

class Game

  attr_reader :current_player, :losses

  def initialize(*player_names)
    @fragment = ''
    @dictionary = Set.new
    file = File.readlines("dictionary.txt")
    file.each { |line| @dictionary.add(line.chomp) }  

    @players = player_names.map { |player_name| Player.new(player_name) }

    @losses = Hash.new(0)

    @players.each { |players| @losses[players.name] = 0 }
    @current_player = @players.first
  end

  def play_round
    self.take_turn(@current_player)
    self.next_player!
    if lost?
      # debugger
      @losses[self.previous_player.name] += 1
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
    @players[-1]
  end


  def next_player!
    # debugger
    @players.rotate!
    @current_player = @players[0]
  end

  def take_turn(player)
    puts "Current word: #{@fragment}"
    string = player.guess
    until valid_play?(string) && string.length == 1
      player.alert_invalid_guess
      puts "Current word: #{@fragment}"
      string = player.guess
    end
    @fragment += string
  end

  def valid_play?(string)
    return false unless @dictionary.any? { |word| word.include?(@fragment + string) }
    true
  end

  def display_standings
    losses.keys.each { |player| print "#{player} => #{self.record(player)}\t" }
    puts 
  end

  def run
    # debugger
    until @players.count == 1
      display_standings
      self.play_round
      @players.reject! { |player| @losses[player.name] == 5 }
    end
    # puts "#{self.previous_player.name} => #{self.record(self.previous_player)}"
    puts "Winner Found #{@players[0].name}!!!"
  end

end

game = Game.new("MD", "ACE", "KING")
game.run
