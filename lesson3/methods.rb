a = [nil, nil, nil, 1, 2, 3]
b = [a, [4, 5, 6]]
p b.assoc(nil)
p a.compact!
p b.flatten
p a.permutation(2).to_a
p a.product([1, 2])

h1 = {a: {b: {c: 'd'}}, e: 4}
p h1.dig(:a, :b, :c)
p h1.flatten
p h1.invert
p h1.transform_values(&:to_s)
h2 = h1.to_proc
p h2.call(:e)

a1 = (1..6)
a2 = (1...6)
p a1.exclude_end?
p a2.exclude_end?
p a1.end
p a2.end