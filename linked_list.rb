class LinkedList
  attr_accessor :head, :tail

  def initialize(value)
    @head = Node.new(value)
    @tail = @head
  end

  def append(value)
    node = Node.new(value)
    @tail.next_node = node
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
  end

  def size
    count = 0
    active_node = @head
    until active_node.nil?
      count += 1
      active_node = active_node.next_node
    end
    count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    if index < 0 || index >= size
      puts 'No such index!'
      return
    end
    count = 0
    active_node = @head
    until count == index
      active_node = active_node.next_node
      count += 1
    end
    active_node.value
  end

  def pop
    active_node = @head
    active_node = active_node.next_node until active_node.next_node == @tail
    @tail.value = nil
    @tail = active_node
    @tail.next_node = nil
  end

  def contains?(value)
    active_node = @head
    result = false
    until active_node.nil?
      if active_node.value == value
        result = true
        break
      end
      active_node = active_node.next_node
    end
    result
  end

  def find(data)
    count = 0
    index = nil
    active_node = @head
    until active_node.nil?
      if active_node.value == data
        index = count
        break
      end
      active_node = active_node.next_node
      count += 1
    end
    index
  end

  def to_s
    active_node = @head
    string = ''
    until active_node.nil?
      string << "( #{active_node.value} ) -> "
      active_node = active_node.next_node
    end
    string << 'nil'
    string
  end

  def insert_at(index, value)
    if index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      node = Node.new(value)
      active_node = @head
      count = 0
      until count == index - 1
        active_node = active_node.next_node
        count += 1
      end
      node.next_node = active_node.next_node
      active_node.next_node = node
    end
  end

  def remove_at(index)
    if index == size - 1
      pop
    elsif index.zero?
      @head.value = nil
      @head = @head.next_node
    else
      count = 0
      active_node = @head
      until count == index - 1
        active_node = active_node.next_node
        count += 1
      end
      active_node.next_node.value = nil
      active_node.next_node = active_node.next_node.next_node
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
