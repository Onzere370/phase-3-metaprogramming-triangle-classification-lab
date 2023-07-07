class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
      :isosceles
    else
      :scalene
    end
  end
  private

  def validate_triangle
    triangle_sides = [@side1, @side2, @side3]
    sum_of_two_sides = triangle_sides.combination(2).map { |sides| sides.sum }
    if triangle_sides.any? { |side| side <= 0 } || sum_of_two_sides.any? { |sum| sum <= triangle_sides.max }
      raise TriangleError
    end
  end
  class TriangleError < StandardError
    def message
      "Invalid triangle sides"
    end
  end
end
