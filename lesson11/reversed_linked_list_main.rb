require_relative 'reversed_linked_list'

list = LinkedList.new

list.append(3)
list.append(5)
list.append(10)

l = list.reverse
p l
p list

list.reverse!
p list
