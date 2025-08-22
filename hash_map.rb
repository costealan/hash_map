require_relative 'linked_list'
class HashMap
  attr_accessor :capacity
  def initialize(load_factor)
    @load_factor = load_factor
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
        @capacity[index].find(key).value = value
      else
        @capacity[index].append(key, value)
      end
    end
  end
  
  def get(key)
    index = hash(key)
    if @capacity[index].contains?(key)
      @capacity[index].find(key) 
    else
      nil
    end
  end

end

hash_map = HashMap.new(0.75)
hash_map.set('Alan', 'Costa')
hash_map.set('Alan', 'Coste')
p hash_map.get('Alan')