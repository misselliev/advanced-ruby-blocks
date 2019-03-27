require_relative './enumerables'
# testing

blq_num = proc { |i| i + 1 }
blq_num2 = proc { |i| i.odd? }
blq_char = proc { |i| i + 'k' }

# chars.my_each { |item| puts item }
# chars.my_each_with_index do |item, index|
# puts "index -> #{index} -- item-> #{item}"
# end
# puts chars.my_select { |item| item.size == 1 } # %w[a, b, c]
# puts numbers.my_select { |item| item % 2 != 0 } # [9, 3, 7]

# puts numbers.my_all? { |item| item.is_a? (Integer)} # true
# puts numbers.my_all? { |item| item.odd? } # false

# puts numbers.my_any? { |item| item.is_a? (String)} # false
# puts numbers.my_any? { |item| item % 2 == 0 } # true

# puts chars.my_none? { |item| item.is_a? (Integer)} # true
# puts chars.my_none? { |item| item == 'alpha' } # false

chars = %w[alpha beta theta omega a b c]
numbers = [9, 3, 2, 4, 7]

puts '       Customized .my_count'
puts numbers.my_count { |item| item.even? } # 2 -- [9, 3, 7]
puts chars.my_count { |word| word.size > 1 } # 4 -- (alpha, beta, theta, omega)
puts chars.my_count { |word| word.size == 5 } # 3 -- ∞w[ alpha, theta, omega ]

puts '       --- Default .count ---'
puts numbers.count { |item| item.even? }
puts chars.count { |item| item.size > 1 }
puts chars.count { |word| word.size == 5 }

# puts numbers.my_map(blq_num) # [10, 4, 3, 5, 8]
# puts numbers.my_map(blq_num2) # [true, true, false, false, true]
# puts chars.my_map(blq_char) # [10, 4, 3, 5, 8]
# puts numbers.my_map { |item| item.even? } # [false, false, true, true, false]
# puts numbers.my_map { |item| item * 2 } # [18, 6, 4, 8, 14]

# puts numbers.my_inject { |i| } # 25
# puts numbers.my_inject(10) { |i| } # 35