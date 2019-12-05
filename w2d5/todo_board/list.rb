require_relative "item.rb"
require "byebug"

class List
  attr_accessor :label
  attr_reader :items

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, disc = "")
    if Item.valid_date?(deadline)
      self.items << Item.new(title, deadline, disc)
      return true
    else 
      return false
    end
  end

  def size
    self.items.count
  end

  def valid_index?(index)
    return false if index < 0 || index >= self.size
    true
  end

  def swap(index_1, index_2)
    return false if !self.valid_index?(index_1) || !self.valid_index?(index_2)
    self.items[index_1], self.items[index_2] = self.items[index_2], self.items[index_1] 
  end

  def [](idx)
    self.items[idx]
  end

  def priority
    self.items.first
  end

  def print
    puts "---------------------------------------------\n #{ self.label.upcase.rjust(30) } \n---------------------------------------------"
    puts "Index    | Item    | Deadline   | Finished?  "
    puts "---------------------------------------------"
    (0...self.size).each do |i|
      puts "#{i.to_s.ljust(8)} | #{self.items[i].title.ljust(8)}| #{self.items[i].deadline.ljust(10)} | #{self.items[i].done} "
    end
    puts "---------------------------------------------"
  end

  def print_full_item(index)
    if self.valid_index?(index)
      puts "---------------------------------------------"
      puts "#{self[index].title.ljust(32)}#{self[index].deadline}\n#{self[index].disc.ljust(28)} Finished: #{self.items[index].done}"
      puts "---------------------------------------------"
    end
  end

  def print_priority
    self.print_full_item(0)
  end

  def up(idx,amt=1)
    return false unless self.valid_index?(idx)
    return true if amt == 0
    return true if idx == 0
    # desbugger
    self.swap(idx-1, idx)
    self.up(idx-1, amt-1)
  end

  def down(idx,amt=1)
    return false unless self.valid_index?(idx)
    return true if amt == 0
    return true if idx == self.items.length-1
    # desbugger
    self.swap(idx, idx + 1)
    self.down(idx + 1, amt-1)
  end

  def sort_by_date!
    self.items.sort_by! { |item| item.deadline }
  end

  def toggle_item(index)
    self[index].toggle
  end

  def remove(index)
    self.items.delete_at(index)
  end

  def purge
    i = 0
    while i < self.size
      if self[i].done == true
        self.remove(i)
        i -= 1
      end
      i += 1
    end
  end

end

# list = List.new("The TO-DO List")

# list.add_item("GYM", "2019-12-30")
# list.add_item("dinner", "2019-12-13", "Pizza")
# list.add_item("launch", "2019-12-31", "Pizza")
# list.add_item('candy', '2019-10-31', '4 bags should be enough')
# list.add_item('shampoo', '2019-10-24')
# list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')

# list[0].toggle

# list[4].toggle
# # # p list.size
# # # p list.items
# # # list.swap(0,3)
# # # p list.print
# # # debugger
# # # p list.down(0,4)
# list.print
# # list.sort_by_date!
# # p list.print_full_item(3)
# # p list.print_priority
# list.purge
# list.print