def merge_sort(arr)
  product = []
  if arr.size <= 1
    return arr
  else
    middle = arr.size / 2
    left = merge_sort(arr.take(middle))
    right = merge_sort(arr.drop(middle))
    while true
      begin
        if left[0] > right[0]
          product.append(right[0])
          right.shift
        else
          product.append(left[0])
          left.shift
        end
      rescue
        break
      end
    end
    left.size > 0 ? product.append(left) : product.append(right)
    return product.flatten!
  end
end

def bubble_sort(arr)
  while true
    flag = 0
    for i in 0...arr.size-1
      if arr[i] > arr[i+1]
        flag = 1
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
    end
    break if flag == 0
  end
end

arr = Array.new(10000) {Random.new.rand(1000)}

time_before = Time.now
merge_sort(arr)
time_after = Time.now
time_merge = time_after - time_before

puts "Merge sort execution time: #{time_merge}" # => Merge sort execution time: 0.049861

time_before = Time.now
bubble_sort(arr)
time_after = Time.now
time_bubble = time_after - time_before

puts "Bubble sort execution time : #{time_bubble}"  # => Bubble sort execution time : 8.861107

puts "The difference in the execution time of the two types of sorting: #{ time_bubble - time_merge }"
# => he difference in the execution time of the two types of sorting: 8.811246
