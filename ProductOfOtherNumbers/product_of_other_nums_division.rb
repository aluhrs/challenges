def sum_nums_except_index(array_of_nums)
  new_array = []
  total = array_of_nums[0]
  array_of_nums.each_with_index do | num, index |
    break if index == (array_of_nums.length - 1)
    total *= array_of_nums[ index + 1 ]
  end
  array_of_nums.each_with_index do | num, index |
    new_array << total/num
  end
  new_array
end

sum_nums_except_index([1, 7, 3, 4]) == [84, 12, 28, 21]
