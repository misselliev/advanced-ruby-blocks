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
  def my_inject(item = nil)
    if item.nil?
      out = self[0]
      idx = 1
      while idx < length
        out = (yield out, self[idx])
        idx += 1
      end
      out
    else
      out = item
      my_each { |a| out = (yield out, a) }
      out
    end
    out
  end
end