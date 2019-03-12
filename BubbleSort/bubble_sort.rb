#   Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology

def bubble_sort(arr)
  runs = arr.size -1
  return arr unless runs < 0

  while changes > 1
    changes = 0

    0.upto(runs) do |i|
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1]
    end
    runs -= 1
  end
  arr
end
end
end

# testing
bubble_sort([4, 3, 78, 2, 0, 2]) # [0,2,2,3,4,78]
bubble_sort([3, 2]) # [2,3]
