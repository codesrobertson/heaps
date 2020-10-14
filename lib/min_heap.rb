class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def add(key, value = key)
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(log n)
  def remove()
    return if @store.empty?

    swap(0, @store.length - 1)
    banished = @store.pop
    heap_down(0)

    return banished.value
  end

  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # Time complexity: O(log n)
  # Space complexity: O(log n)
  def heap_up(index)
    parent = (index - 1) / 2
    bottom = @store[index]

    if index > 0 && @store[parent].key > bottom.key 
      swap(index, parent)
      heap_up(parent)
    end 
  end

  def heap_down(index)
    right_child = 2 * index + 2
    left_child = 2 * index + 1
    max_length = @store.size
    smallest = left_child  
    if left_child >= max_length 
      return 
    end 

    if @store[right_child] 
      smallest = @store[left_child].key > @store[right_child].key ? right_child : left_child
    end 

    if @store[smallest].key < @store[index].key
      swap(smallest, index)
      heap_down(smallest)
    else
      return 
    end
  end

  # Thank you, Chris
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end