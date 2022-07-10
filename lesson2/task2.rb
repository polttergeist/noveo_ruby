def hashtag_remover str
  ht_count = 0
  (0..(str.length-1)).reverse_each do |i|
    if str[i] == '#'
      ht_count += 1
      str.slice!(i)
    elsif ht_count > 0
      ht_count -= 1
      str.slice!(i)
    end
  end
  str
end

def boolean_chain_or1 int
=begin
  if we look closer, we'll find out one curious thing.
  for the sake of simplicity, i will write numbers in binary.
  for input being equal to 1, the output will be also 1.
  for both 10 and 11, the output will be 11.
  for numbers from 100 to 111 we'll get 111, since by summing up all the previous numbers we got 11 as the last two digits,
and in the "or" operation 1 absorbs 0.
  thus, the cycle continues and we get the following: the result for any given number will be equal to the sum of all powers of 2
that are less than the input.
  by knowing math, we conclude that the output will be equal to the smallest power of 2 that is greater than or equal to the input,
subtracted then by 1.
  this exact number will be found through "log2" method from the "Math" module.
=end

  return 0 if int == 0
  2**(Math.log2(int).floor.to_int + 1) - 1
end

def boolean_chain_or2 int
  res = 0
  (0..int).each {|i| res |= i }
  res
end

puts hashtag_remover "abc#d##c"
puts hashtag_remover "abc##d######"
puts hashtag_remover "####"
puts hashtag_remover ""

puts boolean_chain_or1 5
puts boolean_chain_or1 18
puts boolean_chain_or1 32
puts boolean_chain_or2 5
puts boolean_chain_or2 18
puts boolean_chain_or2 32