def two_sum?(arr,target)
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            return true if idx2 > idx1 && ele1 + ele2 == target
        end
    end
    false
                


end
    
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false