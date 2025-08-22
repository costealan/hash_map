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
    hash_code = hash(key)
    @capacity[hash_code] = value
  end
  
end

hash_map = HashMap.new(0.75)
hash_map.set('Alan', 'Coste')
p hash_map.capacity