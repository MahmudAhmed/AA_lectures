require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  attr_writer :funding

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
      salaries.has_key?(title)
  end

  def >(startup_2)
    self.funding > startup_2.funding
  end   

  def hire(e_name, title)
    if valid_title?(title)
        employees << Employee.new(e_name, title)
    else 
      raise_error
    end
  end  

  def size
    employees.count
  end

  def pay_employee(employee)
    salary = salaries[employee.title]
    if funding >= salary
      employee.pay(salary)
      self.funding -= salary
    else
      raise_error
    end
  end   

  def payday
    employees.each { |employee| pay_employee(employee)}
  end
  
  def average_salary
    sum = employees.inject(0) { |sum, employee| sum + salaries[employee.title] }
    sum / employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup_2)
    self.funding += startup_2.funding
    startup_2.salaries.each do |k,v|
      if !salaries.has_key?(k)
        salaries[k] = v 
      end
    end
    startup_2.employees.each {|employee| self.employees << employee }
    startup_2.close
  end
  
end
