#   Create a method called #bubble_sort_by which sorts an array by accepting a block.
#   Remember to use yield inside your method definition to accomplish this.
#   The block will have two arguments that represent the two elements of the array
#   that are currently being compared. The block’s return will be similar to the
#   spaceship operator you learned about before: If the result of the block execution
#   is negative, the element on the left is “smaller” than the element on the right.
#   0 means both elements are equal. A positive result means the left element is greater.
#   Use the block’s return value to sort your array.

def bubble_sort_by(arr)
  lim = arr.size - 1

  (0..lim).each do |j|
    value = yield(arr[j], arr[j + 1])
    arr[j], arr[j + 1] = arr[j + 1], arr[j] if value == 1
  end
  puts arr
end

# testing
bubble_sort_by(%w[hi hello hey]) do |left, right|
  if !right.nil? && !left.nil?
    val = left.size - right.size
    out = nil
    if val.zero?
      out = 0
    elsif val > 0
      out = 1
    elsif val < 0
      out = -1
    end
  end
  out
end
# result= ["hi", "hey", "hello"]
