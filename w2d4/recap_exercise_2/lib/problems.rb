# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    (2..(num_1*num_2)).each do |n|
        return n if n % num_1 == 0 && n % num_2 == 0 
    end 
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str) #"thethrillofit" => th
    hash = Hash.new(0)
    (0...str.length-1).each do |i|
        hash[str[i..i+1]] += 1
    end
    hash.sort_by { |k,v| v }[-1][0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = {}
        self.each do |k, v|
            hash[v] = k
        end
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        comb = self.combination(2).to_a
        comb.count { |pairs| pairs.sum == num }
        # count = 0
        # self.each_index do |i|
        #     self.each_index do |j|
        #         count += 1 if j > i && self[i] + self[j] == num
        #     end
        # end
        # count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc) #([4, 12, 2, 8, 1, 14, 9, 25, 24, 81]
        prc ||= Proc.new { |i,j| i <=> j }
        sorted = false
        until sorted
            sorted = true
            (0...self.length-1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self

    end
end
