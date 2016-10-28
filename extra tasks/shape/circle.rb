class Circle < Shape
  def initialize(radius)
    @radius = radius
  end

  def calculate_area
    area = Math::PI * @radius**2
    puts "Circle area: #{area}"
  end

  def calculate_perimeter
    perimeter = 2 * Math::PI * @radius
    puts "Circle perimeter: #{perimeter}"
  end

  private

  def to_s
    "Circle, radius = #{@radius}"
  end
end
