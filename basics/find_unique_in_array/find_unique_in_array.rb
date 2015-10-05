class FindUniqueInArray
  def self.find_unique(array)
    known = {}
    array.each do |item|
      if known[item]
        known[item] += 1
      else
        known[item] = 1
      end
    end

    found = nil
    known.each do |k, v|
      if v == 1
        found = true
        return k
      end
    end

    return -1 unless found
  end
end

FindUniqueInArray.find_unique([4, 7, 7, 4, 2, 4]) == 2
FindUniqueInArray.find_unique([4, 7, 7, 4, 7]) == -1
