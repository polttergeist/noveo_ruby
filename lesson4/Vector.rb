class Vector
  attr_reader :coords, :length

  def initialize(arr)
    @coords = arr
    @length = arr.length
  end

  def each(&block)
    (0...self.coords.length).each { |i| block.call(self[i]) }
  end

  def [](i)
    @coords[i]
  end

  def add(vect)
    return nil unless vect.length == self.length
    Vector.new(Array.new(vect.length) { |i| self[i] + vect[i]})
  end

  def +(vect)
    add(vect)
  end

  def subtract(vect)
    return nil unless vect.length == self.length
    Vector.new(Array.new(vect.length) { |i| self[i] - vect[i]})
  end

  def -(vect)
    subtract(vect)
  end

  def dot(vect)
    return nil unless vect.length == self.length
    res = 0
    (0...self.length).each { |i| res += vect[i] * self[i]}
    res
  end

  def *(vect)
    dot(vect)
  end

  def norm
    res = 0
    self.each { |i| res += i**2 }
    res ** 0.5
  end

  def to_s
    res = "("
    self.each { |i| res << i.to_s + ", " }
    res[0..-3] + ")"
  end
end


a = Vector.new([1, 2, 3])
b = Vector.new([2, 3, 4])
p a + b
p a - b
p a * b
p a.norm
p a.to_s
