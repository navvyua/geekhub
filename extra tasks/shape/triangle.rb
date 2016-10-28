class Triangle < Shape
  def initialize(sides)
    @sides = sides
  end

  def calculate_area
    p = calculate_perimeter / 2
    area = Math.sqrt(p * (p - @sides[0]) * (p - @sides[1]) * (p - @sides[2]))
    puts "Triangle area: #{area}"
  end

  def calculate_perimeter
    perimeter = @sides[0] + @sides[1] + @sides[2]
    puts "Triangle perimeter: #{perimeter}"
    perimeter
  end

  private

  def to_s
    "Triangle, sides = #{@sides[0]}, #{@sides[1]} and #{@sides[2]}"
  end
end
