# def fib(n)
#   return 1 if n == 1 || n == 2
  
#   fib(n-1) + fib(n-2)
# end

# p 5 <=> 11

# arr = [1,2,3,1,5,6,7,8]

# p arr.max(3) { |a,b| a <=> b }

def hey(person=nil)
  person ||= "you"
  p "hey " + person 
end

p hey