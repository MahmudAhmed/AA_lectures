def my_map(arr, &prc)
  n_arr = []
  arr.each { |ele| n_arr << prc.call(ele) } 
  n_arr
end

def my_select(arr, &prc)
  n_arr = []
  arr.each { |ele| n_arr << ele if prc.call(ele) } 
  n_arr
end

def my_count(arr, &prc)
  count = 0
  arr.each { |ele| count += 1 if prc.call(ele) }
  count
end

def my_any?(arr, &prc)
    arr.each { |ele| return true if prc.call(ele) }
    false
end

def my_all?(arr, &prc)
    arr.each { |ele| return false if !prc.call(ele) }
    true
end

def my_none?(arr, &prc)
    arr.each { |ele| return false if prc.call(ele) }
    true
end
