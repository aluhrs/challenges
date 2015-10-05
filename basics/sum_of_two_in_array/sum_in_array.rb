class SumInArray
  def self.get_sum(ints_array, sum_number)
    sum_hash = {}
    ints_array.each do |int|
      difference = sum_number - int
      sum_hash[int] = difference
      if sum_hash[difference]
        return [ int, difference ]
      end
    end
  end
end

random_ints = [2, 5, 1, 7, 2, 9]
SumInArray.get_sum(random_ints, 12) == [ 7,5 ]
