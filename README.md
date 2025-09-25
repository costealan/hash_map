# HashMap

## Overview
In this project I implement a **hash map** in Ruby, 

In the project the keys are hashed from a given method. To avoid collision the structure gets bigger if certain capacity is reached.

It is part of The Odin Project Ruby path

--

## Features
I use my implementation of [Linked list]([url](https://github.com/costealan/linked_list))

-**Hash map**
  - `hash(key)` generates a hash code for the key  
  - `set(key, value)` adds a new key-value pair or updates an existing one  
  - `get(key)` returns the node for the given key, or `nil` if not found  
  - `has?(key)` returns `true` if the key exists, otherwise `false`  
  - `remove(key)` removes the node with the given key and returns it, or `nil`  
  - `length` returns the total number of stored key-value pairs  
  - `clear` removes all entries from the hash map  
  - `keys` returns an array of all keys in the map  
  - `values` returns an array of all values in the map  
  - `entries` returns an array of all key-value pairs  
  - `increment_load` updates the load factor  
  - `full_capacity?` checks if the load factor exceeds 75%  
  - `double_capacity` doubles the size of the buckets array  
  - `handle_capacity` manages growth by checking load factor and resizing if needed  

---

## Requirements
Coded with Ruby 3.4.2

---

## Example Usage
```ruby
test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')

puts test.get('banana').value
# => "yellow"

puts test.has?('lion')
# => false

puts test.length
# => 4

test.set('apple', 'verde')
puts test.get('apple').value
# => "verde"

puts test.keys
# => ["apple", "banana", "carrot", "dog"]

puts test.values
# => ["verde", "yellow", "orange", "brown"]
```

---

## Credits
Idea and assigment from [The Odin Project]([url](https://www.theodinproject.com/lessons/ruby-hashmap))
Code implementation by me
