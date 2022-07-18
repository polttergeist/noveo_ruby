class LinkedList
  def initialize
    @linkedlist = []
  end

  def append(i)
    @linkedlist.append(i)
  end

  def append_after(p, n)
    tmp = @linkedlist[(@linkedlist.index(p)+1)...@linkedlist.length]
    @linkedlist[(@linkedlist.index(p)+1)...@linkedlist.length] = n
    @linkedlist.concat(tmp)
  end

  def delete(i)
    @linkedlist.delete_at(@linkedlist.index(i))
  end

  def exists?(i)
    @linkedlist.include?(i)
  end

  def to_s
    @linkedlist.to_s
  end
end
