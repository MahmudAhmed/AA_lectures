class Cat

  @@color = "black"

  attr_reader :name

  def initialize(name, age)
    @name = name
    @age = age
  end

  def color
    @@color
  end

  def self.upgrade
    @@color = 'white'
  end

end

cat = Cat.new("dany")
cat2 = Cat.new("molly")

p cat.color
p cat2.color

cat.upgrade

p cat.color
p cat2.color