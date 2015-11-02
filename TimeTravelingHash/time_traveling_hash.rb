class TTH
  def initialize
    @_hash = Hash.new
  end

  def put(timestamp, key, value)
    @_hash[key] ||= Hash.new
    @_hash[key][timestamp] = value
  end

  def get(timestamp, key)
    if @_hash[key]
      if !@_hash[key][timestamp]
        closest_key = get_closest_key(key, timestamp)
        @_hash[key][closest_key] if closest_key
      else
        @_hash[key][timestamp]
      end
    end
  end

  private

  def get_closest_key(key, timestamp)
    sorted_keys = @_hash[key].keys.sort
    previous = nil
    sorted_keys.each do |k|
      break if timestamp < k
      if timestamp > k
        previous = k
      end
    end
    previous
  end

end


t = TTH.new
t.put(1, "key", 25)
t.put(2, "key", 3000)
t.put(1, "foo", 30)
t.put(2.3, "key", 25)
t.put(1.1, "key", 10)
t.put(1.1, "foo", 300)
t.put(1.5, "key", 5)
t.put(2.3, "key", 4)
t.put(5.0, "key", 20)
puts t.get(1, "key") == 25
puts t.get(1, "foo") == 30
puts t.get(1.5, "key") == 5
puts t.get(1.3, "key") == 10
puts t.get(2.0, "key") == 5
puts t.get(5.5, "key") == 20
puts t.get(0.5, "key") == nil
puts t.get(0.5, "key") == nil
