def sum_nums_except_index(array_of_nums)
  new_array = []
  array_of_nums.each_with_index do | num, i |
    if i == (array_of_nums.length - 1)
      product = array_of_nums[0]
    else
      product = array_of_nums[i + 1]
    end
    array_of_nums.each_with_index do | num2, j |
      break if j == (array_of_nums.length - 1)
      if i != j && num != array_of_nums[ j + 1 ]
        product *= array_of_nums[ j + 1 ]
      end
    end
    new_array << product
  end
  new_array
end

puts sum_nums_except_index([1, 7, 3, 4]) == [84, 12, 28, 21]
