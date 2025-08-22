class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value, nil)
    if head == nil
      @head = node
    else
      last_node = find_last
      last_node.next = node
    end  
  end

  def prepend(value)
    old_head = @head
    @head = Node.new(value, old_head)
  end

  def size
    i = 1
    current = @head
    while current.next != nil
      i += 1
      current = current.next
    end
    i 
  end

  def head
    return @head
  end

  def tail
    find_last
  end

  def at(index)
    current = @head
    while index >= 1
      current = current.next
      index -= 1
    end
    current
  end

  def pop
    last_node = tail
    current = @head
    while current.next != last_node 
      current = current.next
    end
    current.next = nil
    last_node
  end

  def contains?(value)
    current = @head
    until current == nil
      if current.value == value
        return true
      else
        current = current.next
      end
    end
    false
  end

  def find(value)
    i = 0
    current = @head
    until current == nil
      if current.value == value
        return i
      end
      i += 1
      current = current.next
    end
    nil
  end

  def to_s
    current = @head
    string = ''
    until current == nil
      string << "( #{current.value} ) -> "
      current = current.next
    end
    string << "nil"
  end

  def insert_at(value, index)
    if index == 0
      prepend(value)
    end
      new_node = Node.new(value, nil)
      previous = nil
      old = nil
      current = @head
      i = 0
      while i <= index
        if i == index - 1
          previous = current
        elsif i == index
          old = current
        end
        current = current.next
        i += 1
      end
      previous.next = new_node
      new_node.next = old
  end

  def remove_at(index)
    current = @head
    if index == 0 && current.next != nil
      @head = current.next
      return
    elsif index == 0 && current.next == nil
      @head = nil
      return 
    end
    i = 0
    previous = nil
    while i <= index
      if i == index - 1
        previous = current
      elsif i == index
        previous.next = current.next
        current.next = nil
      end
      current = current.next
      i += 1
    end
  end

  def find_last(node = @head)
    if node.next == nil
      return node
    end
    find_last(node.next)
  end
end

class Node
  attr_accessor :value, :next
  def initialize(value, next_node)
    @value = value
    @next = next_node
  end
end



list = LinkedList.new

list.append('dog')
# list.append('cat')
# list.append('parrot')
# list.append('hamster')
# list.append('snake')
# list.append('turtle')
# list.insert_at('orca', 3)
# list.insert_at('dolphin', 3)
list.remove_at(0)
puts list