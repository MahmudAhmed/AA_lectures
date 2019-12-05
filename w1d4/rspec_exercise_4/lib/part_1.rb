def my_reject(arr, &prc)
  arr.select { |ele| !prc.call(ele) }
end

def my_one?(arr, &prc) 
 # count = arr.count { |ele| prc.call(ele) }
    count = arr.count(&prc)
  count == 1 
end

def hash_select(hash, &prc)
  h1 = {}
  hash.each do |k, v|
    if prc.call(k,v)
      h1[k] = v
    end
  end
  h1
end

def xor_select(arr, proc1, proc2)
  arr.select do |ele| 
      (proc1.call(ele) || proc2.call(ele)) && !(proc1.call(ele) &&  proc2.call(ele))
  end
end

def proc_count(val, procs)
  procs.count { |proc| proc.call(val)  }
end

