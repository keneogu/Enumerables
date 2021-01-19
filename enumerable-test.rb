# ...1...
puts '1.-------my_each-------'
p(1..5).my_each { |num| puts "the number is #{num}" }
p(%w[Sharon Leo Leila Brian Arun].my_each { |friend| puts "Hello, #{friend}" })
puts ''