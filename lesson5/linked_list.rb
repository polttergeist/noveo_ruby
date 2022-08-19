class LinkedList
  def initialize
    @head = nil
  end

  def append(i)
    new = Node.new(i)
    if @head.nil?
      @head = new
      return
    end
    if @head.next.nil?
      @head.next = new
      return
    end
    tmp = @head.next
    until tmp.next.nil?
      tmp = tmp.next
    end
    tmp.next = new
    true
  end

  def append_after(i, j)
    return nil if @head == nil
    new = Node.new(j)
    tmp1 = @head
    until tmp1.value == i
      tmp1 = tmp1.next
    end
    tmp2 = tmp1.next unless tmp1.next.nil?
    tmp1.next = new
    new.next = tmp2
  end

  def to_s
    res = []
    tmp = @head
    until tmp.nil?
      res << tmp.value
      tmp = tmp.next
    end
    res.to_s
  end

  def delete(i)
    return nil if @head == nil
    tmp = @head
    if @head.value == i
      @head = @head.next
      return
    end
    until tmp.next.value == i
      tmp = tmp.next
      if tmp.next.nil? then break end
    end
    begin
      tmp.next = tmp.next.next
    rescue NoMethodError
      return nil
    end
  end

  def find(i)
    return nil if @head == nil
    tmp = @head
    until tmp.value == i
      if tmp.next.nil? then return end
      tmp = tmp.next
    end
    tmp
  end
end

class Node
  attr_accessor :value, :next

  def initialize(i)
    @value = i
    @next = nil
  end

  def to_s
    value.to_s
  end
end
