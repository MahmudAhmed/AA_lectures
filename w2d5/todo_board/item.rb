class Item

  def self.valid_date?(date)
    parts = date.split("-")
    return false if parts.count != 3
    return false if parts[0].length != 4
    return false if parts[1].length != 2 || parts[1].to_i < 0 || parts[1].to_i > 12
    return false if parts[2].length != 2 || parts[2].to_i < 0 || parts[2].to_i > 31
    true
    # Date.valid_date?(parts[0], parts[1], parts[2])
  end

  attr_accessor :title, :disc
  attr_reader :deadline, :done

  def initialize(title, deadline, disc)
    @title = title
    if Item.valid_date?(deadline) 
      @deadline = deadline 
    else
      raise "Invalid Date"
    end
    @disc = disc
    @done = false
  end

  def deadline=(date)
    if Item.valid_date?(date) 
      @deadline = date
    else
      raise "Invalid Date"
    end
  end

  def toggle
    self.done == true ? @done = false : @done = true    
  end



end


# item = Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')
# p item.done
# item.toggle
# p item.done
# item.toggle
# p item.done
# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
#) ## raises error due to invalid date

# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

