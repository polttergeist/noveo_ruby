require_relative 'binary_tree'

tree = BinaryTree.new

tree.add(10) #=> 10
tree.add(20) #=> 20
tree.add(30) #=> 30
tree.add(5)
tree.add(15)
tree.add(3)
tree.add(8)

tree.delete(30) #=> 10
tree.delete(26) #=> nil

puts tree.find(20) #=> 20
puts tree.find(26) #=> nil
