def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    n_str = []

    str.split.each do |word|
        n_str << prc.call(word)
    end

    n_str.join(" ")
end

def greater_proc_value(num_1, prc_1, prc_2)
    n1 = prc_1.call(num_1)
    n2 = prc_2.call(num_1)

    if n1 > n2
       n1
    else
       n2
    end
end

def and_selector(arr, prc1, prc2)
    arr.select { |ele| prc1.call(ele) && prc2.call(ele) }
end

def alternating_mapper(arr, prc1, prc2)
    arr.map.with_index do |ele, i|
        if i.even?
            prc1.call(ele)
        else
            prc2.call(ele)
        end
    end
end