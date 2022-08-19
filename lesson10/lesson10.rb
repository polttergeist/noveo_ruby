class Shape
  attr_reader :area

  include Comparable
  
  def <=>(shape)
    self.area <=> shape.area
  end
end

class Square < Shape
  attr_reader :side

  def initialize(side)
    @side = side
    @area = side**2
  end
end

class Rectangle < Shape
  attr_reader :side1, :side2

  def initialize(side1, side2)
    @side1 = side1
    @side2 = side2
    @area = side1*side2
  end
end

class Triangle < Shape
  attr_reader :base, :height

  def initialize(base, height)
    @base = base
    @height = height
    @area = (base*height).to_f/2
  end
end

class Circle < Shape
  attr_reader :radius

  def initialize(radius)
    @radius = radius
    @area = radius**2 * Math::PI
  end
end

class CustomShape < Shape
  def initialize(area)
    @area = area
  end
end

shapes = [Square.new(3), Rectangle.new(2, 4), Triangle.new(2, 5), Circle.new(3), CustomShape.new(10)]

puts shapes.sort
