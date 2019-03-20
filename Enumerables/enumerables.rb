module Enumerable
  # 1
  def my_each
    return to_enum unless block_given?

    for i in self do
      yield i
    end
  end

  # 2
  def my_each_with_index
    return to_enum unless block_given?

    index = 0
    my_each do |i|
      yield i, index
      index += 1
    end
  end

  # 3
  def my_select
    return to_enum unless block_given?

    sel = []
    my_each do |i|
      if yield i
        sel << i
      end
    end
    sel
  end

  # 4
  def my_all?
    return to_enum unless block_given?

    yes = []
    my_each do |i|
      yes << i if yield i
    end
    yes.size == size
  end

  #5
  def my_any?
    return to_enum unless block_given?

    yes = []
    my_each do |i|
      yes << i if yield i
    end
    !yes.empty?
  end

  #6
  def my_none?
    return to_enum unless block_given?

    yes = []
    my_each do |i|
      yes << i if yield i
    end
    yes.size.zero?
  end

  #7
  def my_count
    return to_enum unless block_given?

    yes = []
    my_each do |i|
      yes << i if yield i
    end
    yes.size
  end

  #8
  def my_map(*arg)
    # return to_enum unless block_given?
    res = []
    if arg.empty?
      my_each do |i|
        res << i if yield i
      end
    else
      my_each do |i|
        res << arg[0].call(i)
      end
    end
    res
  end

  #9
  def my_inject(total = 0)
    return to_enum unless block_given?

    my_each do |i|
      yield i
      total += i
    end
    total
  end

  # testing

  chars = %w[alpha beta theta omega a b c]
  numbers = [9, 3, 2, 4, 7]
  blq_num = Proc.new { |i| i + 1 }
  blq_char = Proc.new { |i| i + 'k' }

  chars.my_each { |item| puts item }
  chars.my_each_with_index { |item, index|
    puts "index -> #{index} -- item-> #{item}"
  }
  puts chars.my_select { |item| item.size == 1 } # %w[a, b, c]
  
  puts numbers.my_all? { |item| item.is_a? (Integer)} # true
  puts numbers.my_all? { |item| item.odd? } # false

  puts numbers.my_any? { |item| item.is_a? (String)} # false
  puts numbers.my_any? { |item| item % 2 == 0 } # true

  puts chars.my_none? { |item| item.is_a? (Integer)} # true
  puts chars.my_none? { |item| item == 'alpha' } # false

  puts numbers.my_count { |item| item.even? } # 2
  puts chars.my_count { |item| item.size > 1 } # 4
  
  puts numbers.my_map(blq_num) # [10, 4, 3, 5, 8]
  puts numbers.my_map { |item| item < 5 } # [3, 2, 4]
  

  puts [1, 2, 1, 2].inject { |i| i + 2 if i.odd? }
  puts numbers.my_inject { |i| i + 2 if i.odd? }
  puts numbers.my_inject(10) { |i| i + 2 if i.odd? }
end
