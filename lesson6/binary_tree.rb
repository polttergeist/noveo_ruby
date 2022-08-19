require_relative 'node'

class BinaryTree
  def initialize
    @root = nil
  end

  def add(i)
    add_rec(i, @root)
  end

  def find(i)
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

  private

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

  def add_rec(i, tmp=@root)
    if @root == nil
      @root = Node.new(i)
      return
    end
    case tmp.value <=> i
    when -1
      if tmp.left.nil?
        tmp.left = Node.new(i)
      else
        self.add_rec(i, tmp.left)
      end
    when 1
      if tmp.right.nil?
        tmp.right = Node.new(i)
      else
        self.add_rec(i, tmp.right)
      end
    else
      nil
    end
  end
end
