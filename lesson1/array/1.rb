a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.each { |el| puts el }
puts
a.each { |el| puts el if el > 5 }
puts
b = a.select { |el| el.odd? }
b.each { |el| puts el }
puts
a << 11
a.unshift(3)
p a
