class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(i, tmp=@root)
    if @root == nil
      @root = Node.new(i)
      return
    end
    case tmp.value <=> i
    when -1
      if tmp.left.nil?
        tmp.left = Node.new(i)
      else
        self.add(i, tmp.left)
      end
    when 1
      if tmp.right.nil?
        tmp.right = Node.new(i)
      else
        self.add(i, tmp.right)
      end
    else
      nil
    end
  end

  def find(i, tmp=@root)
    if i == @root.value
      @root.value
    end
    parent, child = find_parent(i)
    if child.nil?
      nil
    else
      i
    end
  end

  def delete(i)
    if @root.value == i
      @root = nil
      return
    end
    parent, child = find_parent(i)
    case child
    when :left
      parent.left = nil
    when :right
      parent.right = nil
    else
      nil
    end
  end


  protected

  def find_parent(i, tmp=@root)
    if tmp.nil?
      nil
    elsif !tmp.left.nil?
      if tmp.left.value == i
        return tmp, :left
      else
        find_parent(i, tmp.left)
      end
    elsif !tmp.right.nil?
      if tmp.right.value == i
        return tmp, :right
      elsif i > tmp.right.value
        find_parent(i, tmp.right)
      end
    else
      nil
    end
  end
end

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left, @right = nil, nil
  end
end
