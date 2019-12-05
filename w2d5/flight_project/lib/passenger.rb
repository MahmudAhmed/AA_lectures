class Passenger
  attr_reader :name
  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(f_num)
    @flight_numbers.include?(f_num.upcase)
  end

  def add_flight(f_num)
    @flight_numbers << f_num.upcase unless self.has_flight?(f_num)
  end

end