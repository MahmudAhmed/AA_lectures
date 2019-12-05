require_relative "passenger.rb"
class Flight
  attr_reader :passengers, :capacity
  def initialize(f_num, cap)
    @flight_number = f_num.upcase
    @capacity = cap
    @passengers = []
  end

  def full?
    self.passengers.length == self.capacity 
  end

  def board_passenger(pass)
    unless self.full?
      self.passengers << pass if pass.has_flight?(@flight_number)
    end
  end

  def list_passengers
    self.passengers.map { |pass| pass.name }
  end

  def [](idx)
    self.passengers[idx]
  end

  def <<(pass)
    self.board_passenger(pass)
  end


end

pass = Passenger.new("Mahmud")