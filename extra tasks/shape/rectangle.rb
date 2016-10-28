class Rectangle < Shape
  def initialize(sides)
    @sides = sides
  end

  def calculate_area
    area = @sides[0] * @sides[1]
    puts "Rectangle area: #{area}"
  end

  def calculate_perimeter
    perimeter = 2 * (@sides[0] + @sides[1])
    puts "Rectangle perimeter: #{perimeter}"
  end

  def calculate_triangles
    diameter = Math.sqrt(@sides[0]**2 + @sides[1]**2)
    puts "Rectangle consist of 2 triangles with sides: \
#{@sides[0]}, #{@sides[1]}, #{diameter}"
  end

  private

  def to_s
    "Rectangle, sides = #{@sides[0]} and #{@sides[1]}"
  end
end
