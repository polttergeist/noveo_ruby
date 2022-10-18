require_relative 'useful'
require_relative 'indifferent_accessable'

str1 = "string one"
str2 = "string two"

str1.capitalizable!

p str1.capitalize_each_word
p str2.capitalize_each_word # throws an error

hash1 = { a: 1, 'b' => 2, 1 => 3 }.make_indifferent_accessable!

puts hash1['a'] #=> 1
puts hash1[:b] #=> 2
puts hash1[1] #=> 3

hash2 = { d: 3, true => 'True' }
puts hash2.make_indifferent_accessable!['d']
puts hash2[true] #=> True
