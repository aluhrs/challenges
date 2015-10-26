def unique_chars(st)
  st = st.chars.sort.join
  found = true
  st.each_char.with_index do |c, i|
    unless i == st.length
      if c == st[i+1]
        found = false
      end
    end
  end
  found
end

puts unique_chars('abcded') == false
