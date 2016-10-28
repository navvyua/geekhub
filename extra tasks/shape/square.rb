class Square < Shape
  def initialize(side)
    @side = side
  end

  def calculate_area
    area = @side**2
    puts "Square area: #{area}"
  end

  def calculate_perimeter
    perimeter = @side * 4
    puts "Square perimeter: #{perimeter}"
  end

  def calculate_triangles
    diameter = Math.sqrt(2) * @side
    puts "Square consist of 2 triangles with sides: \
#{@side}, #{@side}, #{diameter}"
  end

  private

  def to_s
    "Square, side = #{@side}"
  end
end
