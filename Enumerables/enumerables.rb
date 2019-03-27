module Enumerable
  # 1
  def my_each
    return to_enum unless block_given?

    each do |i|
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
      sel << i if yield i
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

  # 5
  def my_any?
    return to_enum unless block_given?

    yes = []
    my_each do |i|
      yes << i if yield i
    end
    !yes.empty?
  end

  # 6
  def my_none?
    return to_enum unless block_given?

    yes = []
    my_each do |i|
      yes << i if yield i
    end
    yes.size.zero?
  end

  # 7
  def my_count
    return size unless block_given?

    yes = []
    my_each do |i|
      yes << i if yield i
    end
    yes.size
  end

  # 8
  def my_map(*arg)
    # return to_enum unless block_given?
    res = []
    if arg.empty?
      my_each do |i|
        x = yield i
        res << x
      end
    else
      my_each do |i|
        x = arg[0].call(i)
        res << x
      end
    end
    res
  end

  # 9
  def my_inject(total = nil)
    return to_enum unless block_given?
    my_each do |item|
      if total.nil?
        total = '' if item.is_a? String
        total = 0 if item.is_a? Integer
        total = [] if item.is_a? Array
        total = 0.0 if item.is_a? Float
      end
      yield total, item 
      
      total += item
    end
    total
  end
end
