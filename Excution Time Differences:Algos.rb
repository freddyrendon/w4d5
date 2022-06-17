# my_min
# Given a list of integers find the smallest number in the list.

# Example:
    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5

# Phase I
# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(arr)
  arr.sort.first
end 

# p my_min(list)     


# Phase II
# Now rewrite the function to iterate through the list just once while keeping track
#  of the minimum. What is the time complexity?

def my_min(arr)
    min = arr[0]
    arr.each do |ele|
        if ele < min 
         min = ele 
        end 
    end 
    min 
end 

# p my_min(list)



# possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7


# list = [5, 3, -7]
# largest_contiguous_subsum(list) # => 8
#  list = [2, 3, -6, 7, -6, 7]
# largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# list = [-5, -1, -3]
# largest_contiguous_subsum(list) # => -1 (from [-1])

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested 
# loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array 
# and return the max.

def largest_contiguous_subsum(arr)
    # holder = []

    # (0..arr.length).each do |idx1|
    #     # new_arr = []
    #     (idx1...arr.length).each do |idx2|
    #         holder << arr[idx1..idx2]
    #     end 
    #     # holder << new_arr
    # end 

    # if arr.any? { |ele| ele > 0}
    #     total = 0 
    #     holder.each do |subarr|
    #         sum = 0 
    #         subarr.each do |ele|
    #             sum += ele
    #         end 
    #         if total < sum 
    #             total = sum 
    #         end 
    #     end 
    #     total 
    # else 
    # return -1
    # end 
    gobal_max = -1000000
    arr.each_with_index do |num1, i|
        local_max = num1
        arr.each_with_index do |num2, j|
            break if local_max < 0 || num2 < 0 
            if j > i 
                local_max += num2
            end
        end 
        gobal_max = [local_max, gobal_max].max
    end 
    gobal_max
end 

# pp largest_contiguous_subsum(list)



# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory.
#  Keep a running tally of the largest sum. To accomplish this efficient space complexity, 
#  consider using two variables. One variable should track the largest sum so far and another 
#  to track the current sum. We'll leave the rest to you.

  list = [2, 3, -6, 7, -6, 7]


def largest_contiguous_subsum(arr)
largest_sum = -100000000 
current_sum = 0 

arr.each do |ele|
    if current_sum < 0 
        current_sum = 0 
    end 
    current_sum += ele 
    largest_sum = [largest_sum, current_sum].max
end 
largest_sum
end 

p largest_contiguous_subsum(list)