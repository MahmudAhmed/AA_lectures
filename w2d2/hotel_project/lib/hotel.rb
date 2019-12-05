require_relative "room"

class Hotel
  attr_reader :rooms

  def initialize(name,rooms)
    @name = name
    @rooms = {}
    rooms.each do |names,capacity|
      @rooms[names] = Room.new(capacity)
    end
  end

  def name
    @name.split.map { |word| word.capitalize }.join(" ")
  end

  def room_exists?(name)
    rooms.has_key?(name)
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
        p "sorry, room does not exist"
    elsif self.rooms[room_name].add_occupant(person)
        p "check in successful"
    else  
        p "sorry, room is full"
    end
  end   

  def has_vacancy?
    rooms.values.any? { |el| !el.full? }
  end   

  def list_rooms
    rooms.keys.each do |room_names|
        puts room_names + rooms[room_names].available_space.to_s
    end
  end   
end
