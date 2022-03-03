require 'benchmark'

#You are given three arrays of equal size. Each array has 1 million RANDOM integer values.
#
# Assume that each array is already sorted in ascending order and that no individual array has any duplicate values.
#
# Your goal is to write a method/function that will return an array of any/all values which are present in all three arrays.
#
# Bonus: Once you’ve found a working solution, try to optimize to run in O(n) time and 1x space complexity.
#
# Small Scale Example Below
#
#     #Ruby
#     nums_1 = [1, 2, 4, 5, 8]
#     nums_2 = [2, 3, 5, 7, 9]
#     nums_3 = [1, 2, 5, 8, 9]
#     find_matches(nums_1, nums_2, nums_3)
#     => [2, 5]
#
#     #JavaScript
#     nums1 = [1, 2, 4, 5, 8]
#     nums2 = [2, 3, 5, 7, 9]
#     nums3 = [1, 2, 5, 8, 9]
#     findMatches(nums1, nums2, nums3)
#     => [2, 5]

# Method 1:
# Combine all three arrays and return tripled numbers

#Method 2:
# Compare 2 arrays for duplicate numbers :: Use the return value of that to compare to the third array

#method 3:
# Create a database and use active record/ SQL to compare the data
    x = 10000000
    nums_1 = Array.new(x) { rand(1...x*2000) }.uniq.sort
    nums_2 = Array.new(x) { rand(1...x*2000) }.uniq.sort
    nums_3 = Array.new(x) { rand(1...x*2000) }.uniq.sort
    nums_1 = nums_1[0..x]
    nums_2 = nums_2[0..x]
    nums_3 = nums_3[0..x]


def find_matches(nums_1, nums_2, nums_3)
  nums_all = nums_1 + nums_2 + nums_3
  sorted_nums_all = nums_all.sort
  counter = 0
  answer = []
  sorted_nums_all.each do |num|
    if sorted_nums_all[counter] == sorted_nums_all[counter + 2]
      answer << num
    end
    counter += 1
  end
  p answer
end

puts Benchmark.measure { find_matches(nums_1, nums_2, nums_3) }
