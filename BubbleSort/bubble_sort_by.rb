=begin  
  Create a method called #bubble_sort_by which sorts an array by accepting a block.
  Remember to use yield inside your method definition to accomplish this.
  The block will have two arguments that represent the two elements of the array
  that are currently being compared. The block’s return will be similar to the
  spaceship operator you learned about before: If the result of the block execution
  is negative, the element on the left is “smaller” than the element on the right.
  0 means both elements are equal. A positive result means the left element is greater.
  Use the block’s return value to sort your array.
=end

def bubble_sort_by(arr)
  lim = arr.size - 2

  (0..lim).each { |j|
    res = yield arr[j], arr[j + 1]
    
    unless arr[j].nil? && arr[j + 1].nil?
      arr[j], arr[j + 1] = arr[j + 1], arr[j] if res > 0
     end
  }
  arr
end

# testing..

puts bubble_sort_by(['hi', 'hello', 'hey']){|left, right| left.length - right.length }
# result= ["hi", "hey", "hello"]