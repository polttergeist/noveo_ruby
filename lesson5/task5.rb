require_relative 'pagination_helper'
require_relative 'linked_list'


helper = PaginationHelper.new(%w[a b c d e f], 4)

p helper.page_count() # 2
p helper.item_count() # 6
p helper.page_item_count(0)  # 4, т.к нумерация страниц с 0
p helper.page_item_count(1) # 2, последняя страница содержит 2 элемента
p helper.page_item_count(2) # -1

p helper.page_index(5) # 1
p helper.page_index(2) # 0
p helper.page_index(20) # -1
p helper.page_index(-10) # -1

another = PaginationHelper.new([1, 2, 3, 4, 5, 7, 8], 2)

p another.page_count() # 4
p another.item_count() # 7
p another.page_item_count(0)  # 2, т.к нумерация страниц с 0
p another.page_item_count(3) # 1, последняя страница содержит 1 элемент
p another.page_item_count(12) # -1

p another.page_index(5) # 2
p another.page_index(2) # 1
p another.page_index(20) # -1
p another.page_index(-10) # -1


list = LinkedList.new

list.append(3)
list.append(5)
list.append(10)
puts list #=> (3, 5, 10)

list.append_after(3, 15)
puts list #=> (3, 15, 5, 10)
list.append_after(10, 25)
puts list #=> (3, 15, 5, 10, 25)

puts list.delete(10)
puts list.exists?(25)