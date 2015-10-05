class FlattenHash
  def self.flatten(hash)
    new_hash = {}
    hash.each do |k,v|
      if v.is_a?(Hash)
        v.each do |k1, v1|
          new_hash["#{k}.#{k1}"] = v1
        end
      else
        new_hash[k.to_s] = v
      end
    end
    new_hash
  end
end

hash = { 'key': { 'key1': 'a', 'key2': 'b'}, 'key3': 'c'}
puts FlattenHash.flatten(hash) == {"key.key1"=>"a", "key.key2"=>"b", "key3"=>"c"}
