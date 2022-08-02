require_relative 'tryable'
include Tryable


p false.try { even? } # nil
p false.try(&:even?) # nil
p 2.try(&:even?) # true
p 1.try { |obj| obj + 1 } # 2
p true.try { |obj| obj + 1 } # nil
p 1.try { |obj| obj + '' } # it still should raise error “String can't be coerced into Integer”


add_num_1 = add_num(1) # proc

puts add_num_1.call(3) # 4
puts add_num_1.call(5.7) # 6.7

add_num_m10 = add_num(-10)

puts add_num_m10.call(44) # 34
puts add_num_m10.call(-20) # -30
