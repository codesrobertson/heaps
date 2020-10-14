# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heap_sort(list)
  heap = MinHeap.new
  list.each do |n|
    heap.add(n)
  end

  i = 0

  until i > list.size
    list[i] = heap.remove
    i += 1
  end

  return list
end