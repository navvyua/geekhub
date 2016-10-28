require_relative 'shape'
require_relative 'circle'
require_relative 'square'
require_relative 'rectangle'
require_relative 'triangle'

puts 'Types: Circle, Square, Rectangle, Triangle'
print 'Enter type of shape: '

shape = gets.chomp

case shape.downcase
when 'circle'
  print 'Enter circle radius: '
  radius = gets.chomp.to_i
  circle = Circle.new(radius)
  puts circle
  circle.calculate_area
  circle.calculate_perimeter
when 'square'
  print 'Enter square side: '
  side = gets.chomp.to_i
  square = Square.new(side)
  puts square
  square.calculate_area
  square.calculate_perimeter
  square.calculate_triangles
when 'rectangle'
  sides = []
  print 'Enter rectangle first side: '
  sides << gets.chomp.to_i
  print 'Enter rectangle second side: '
  sides << gets.chomp.to_i
  rectangle = Rectangle.new(sides)
  puts rectangle
  rectangle.calculate_area
  rectangle.calculate_perimeter
  rectangle.calculate_triangles
when 'triangle'
  sides = []
  print 'Enter triangle first side: '
  sides << gets.chomp.to_i
  print 'Enter triangle second side: '
  sides << gets.chomp.to_i
  print 'Enter triangle third side: '
  sides << gets.chomp.to_i
  triangle = Triangle.new(sides)
  puts triangle
  triangle.calculate_area
  triangle.calculate_perimeter
else
  puts 'Invalid shape type'
end
