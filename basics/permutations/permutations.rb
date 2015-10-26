def permutations(s1, s2)
  s1 = s1.chars.sort.join
  s2 = s2.chars.sort.join
  s1 == s2
end

puts permutations('cat','act') == true
puts permutations('fact','live') == false
