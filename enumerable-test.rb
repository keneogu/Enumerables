# ...1...
puts '1.-------my_each-------'
p(1..5).my_each { |num| puts "the number is #{num}" }
p(%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts "Hello, #{friend}" })
puts ''

# ..2...
puts '2.-------my_each_with_index-------'
p(%w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| puts friend if index.even? })
p(%w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| puts "#{friend} is index #{index}" })
p((1..5).my_each_with_index { |item, index| puts "#{item} is #{index}" })
puts ''