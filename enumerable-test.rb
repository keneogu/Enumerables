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

# ..3...
puts '3.-------my_select-------'
p(%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' })
puts ''

# ..4...
puts '4.-------my_all-------'
puts(%w[ant bear cat].my_all? { |word| word.length >= 3 }) #=> true
puts(%w[ant bear cat].my_all? { |word| word.length >= 4 }) #=> false
puts %w[ant bear cat].my_all?(/t/) #=> false
puts [1, 2i, 3.14].my_all?(Numeric) #=> true
puts [].my_all? #=> true
puts ''

# ..5...
puts '5.-------my_any-------'
puts(%w[ant bear cat].my_any? { |word| word.length >= 3 }) #=> true
puts(%w[ant bear cat].my_any? { |word| word.length >= 4 }) #=> true
puts %w[ant bear cat].my_any?(/d/) #=> false
puts [nil, true, 99].my_any?(Integer) #=> true
puts [nil, true, 99].my_any? #=> true
puts [].my_any? #=> false
puts ''

# ..6...
puts '6.-------my_none-------'
p(%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
p(%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
p %w[ant bear cat].my_none?(/d/) #=> true
p [1, 3.14, 42].my_none?(Float) #=> false
p [].my_none? #=> true
p [nil].my_none? #=> true
p [nil, false].my_none? #=> true
p [nil, false, true].my_none? #=> false
puts ''

# ..7...
puts '7.-------my_count-------'
puts [1, 2, 4, 2].my_count #=> 4
puts [1, 2, 4, 2].my_count(2) #=> 2
puts([0, 1, 2, 3].count { |element| element > 1 }) # => 2
p((1..3).my_count) #=> 3
puts ''