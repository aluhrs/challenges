def encode_string(st)
  st.split(' ').join('%20')
end

puts encode_string("This is a string") == "This%20is%20a%20string"
