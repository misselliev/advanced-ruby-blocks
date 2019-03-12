#   Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology

def bubble_sort(arr)
  runs = arr.size -1
  return arr if runs < 0

  counter = 0

  0.upto(runs) do |i|
    if arr[i] > arr[i + 1]
      arr[i], arr[i + 1] = arr[i + 1], arr[i]
      counter += 1
    end
  end
end

# testing
bubble_sort([4, 3, 78, 2, 0, 2]) # [0,2,2,3,4,78]
