# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology

def bubble_sort(arr)
  valid = false

  until valid
    arr = bucle(arr)

    collect = []
    (arr.size - 1).times { |j| collect << (arr[j] <= arr[j + 1]) }

    valid = true if collect.select { |item| item == true }.size == arr.size - 1
  end
  arr
end

def bucle(input)
  i = 0
  until i == input.size - 1
    input[i], input[i + 1] = input[i + 1], input[i] if input[i] > input[i + 1]
    i += 1
  end
  input
end

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
<<<<<<< HEAD
puts bubble_sort([4, 3, 78, 2, 0, 2]) # [0,2,2,3,4,78]
puts bubble_sort([3, 2]) # [2,3]
=======
bubble_sort([4, 3, 78, 2, 0, 2]) # [0,2,2,3,4,78]
bubble_sort([3, 2]) # [2,3]
>>>>>>> ba2cd529699876f97b50bf508a71565b345fe1db
