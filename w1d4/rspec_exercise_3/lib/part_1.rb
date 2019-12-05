def is_prime?(num) #10
  return false if num < 2 
  (2...num).each do |n| #2,3,4,5,6,7,8,9
    if num % n == 0
      return false
    end
  end
  true
end

def nth_prime(num)
  counter = 0
  n = 1
  until counter == num
    n += 1
    counter += 1 if is_prime?(n)
  end
  n 
end

def prime_range(min, max)
  (min..max).select { |n| is_prime?(n) }
end

