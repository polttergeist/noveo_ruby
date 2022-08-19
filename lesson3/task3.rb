def ranger arr1
  return [] if arr1 == []
  max_val = arr1.max
  min_val = arr1.min
  rank, counter = 1, 1
  arr2 = Array.new
  (min_val..max_val).reverse_each do |i|
    while arr1.include?(i) do
      arr2[arr1.index(i)] = rank
      arr1[arr1.index(i)] = nil
      counter += 1
    end
    rank = counter
  end
  arr2
end

def hash_creator str
  h = {}
  str.split(', ').each { |i| h[i.split('=')[0].to_sym] = i.split('=')[1].to_i }
  h
end

p ranger [5, 6, 7, 9]
p ranger [5, 5, 5]
p ranger [10, 34, 28, 6, 34, 6]
p ranger []

p hash_creator "a=4, b=5, c=7"
p hash_creator "a=7"
p hash_creator ""