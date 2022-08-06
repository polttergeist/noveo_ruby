class Shape
  attr_accessor :area

  def <=>(shape)
    self.area <=> shape.area
  end

  def to_s
    area.to_s
  end
end

class Square < Shape
  attr_accessor :side

  def initialize(side)
    @side = side
    @area = side**2
  end
end

class Rectangle < Shape
  attr_accessor :side1, :side2

  def initialize(side1, side2)
    @side1 = side1
    @side2 = side2
    @area = side1*side2
  end
end

class Triangle < Shape
  attr_accessor :base, :height

  def initialize(base, height)
    @base = base
    @height = height
    @area = (base*height).to_f/2
  end
end

class Circle < Shape
  attr_accessor :radius

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
