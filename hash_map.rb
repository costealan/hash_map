require_relative 'linked_list'
class HashMap
  attr_accessor :capacity
  def initialize
    @load_factor = 0.75
    @capacity = Array.new(16)
  end

  def hash(key)
   hash_code = 0
   prime_number = 31
      
   key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
      
   hash_code % 16
  end

  def set(key, value)
    index = hash(key)
      raise IndexError if index.negative? || index >= @capacity.length

    if @capacity[index] == nil
      list = LinkedList.new
      list.append(key, value)
      @capacity[index] = list
    else 
      if @capacity[index].contains?(key)
        @capacity[index].find_node(key).value = value
      else
        @capacity[index].append(key, value)
      end
    end
  end
  
  def get(key)
    index = hash(key)
    if @capacity[index].contains?(key)
      @capacity[index].find_node(key) 
    else
      nil
    end
  end

  def has?(key)
    index = hash(key)
    if @capacity[index] == nil
      return false
    end
    @capacity[index].contains?(key)
  end

  def remove(key)
    index = hash(key)
    if @capacity[index] == nil
      return nil
    end
    if !@capacity[index].contains?(key)
      return nil
    end
   removed_node = @capacity[index].find_node(key)
   @capacity[index].remove_at(@capacity[index].find_index(key))
   removed_node
  end

  def length
    result = 0
    @capacity.each do |bucket|
      if bucket != nil
        result += bucket.size
      end
    end
    result
  end

  def clear
    @capacity = Array.new(16)
  end

  def keys
    result = Array.new
    @capacity.each do |bucket|
     if bucket != nil
       result.push(bucket.keys)
     end
    end
    result.flatten
  end
end

 test = HashMap.new

 test.set('apple', 'red')
 test.set('banana', 'yellow')
 test.set('carrot', 'orange')
 test.set('dog', 'brown')
 test.set('elephant', 'gray')
 test.set('frog', 'green')
 test.set('grape', 'purple')
 test.set('hat', 'black')
 test.set('ice cream', 'white')
 test.set('jacket', 'blue')
 test.set('kite', 'pink')
 test.set('lion', 'golden')

 test.set('lion', 'dorado')
 test.set('frog', 'verde')
 test.set('elephant', 'gris')

p test.keys
