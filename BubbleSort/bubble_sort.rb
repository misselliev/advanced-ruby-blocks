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

# testing
puts bubble_sort([4, 3, 78, 2, 0, 2]) # [0,2,2,3,4,78]
puts bubble_sort([3, 2]) # [2,3]
