require_relative "item.rb"
require_relative "list.rb"

class TodoBoard
  def initialize
    @list = {}
  end

  def get_command
      print "\nEnter a command: "
      cmd, *args = gets.chomp.split(' ')

      label = args[0]
      other_args = args[1..-1]
      
      case cmd
      when 'mklist'
        @list[label] = List.new(label) 
      when 'mktodo'
        @list[label].add_item(*other_args)
      when 'ls'
        puts @list.keys
      when 'showall'
        @list.values.each { |list| list.print }
      when 'up'
        @list[label].up(*other_args.map(&:to_i))
      when 'down'
        @list[label].down(*other_args.map(&:to_i))
      when 'swap'
        @list[label].swap(*other_args.map(&:to_i))
      when 'sort'
        @list[label].sort_by_date!
      when 'priority'
        puts @list[label].priority
      when 'toggle'
        @list[label].toggle_item(*other_args.map(&:to_i))
      when 'print'
        other_args.empty? ? @list[label].print : @list[label].print_full_item(*other_args.map(&:to_i))
      when 'rm'
        @list[label].remove(*other_args.map(&:to_i))
      when 'purge'
        @list[label].purge
      when 'quit'
        return false
      else
        print "Sorry, that command is not recognized."
      end

      true
  end

  def run 

    while self.get_command
      self.get_command
    end

  end

end

todo = TodoBoard.new
todo.run