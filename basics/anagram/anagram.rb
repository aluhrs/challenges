class Anagram
  def self.find_the_anagrams(words)
    word_hash = {}

    words.each do |word|
      sorted = word.chars.sort.join
      if word_hash[sorted]
        word_hash[sorted] << word
      else
        word_hash[sorted] = [ word ]
      end
    end

    word_hash.values
  end
end

input = ["cat", "act", "bat", "alligator", "tac", "tab", "dog"]
output = [["cat", "act", "tac"], ["bat", "tab"], ["alligator"], ["dog"]]
Anagram.find_the_anagrams(input) == output
