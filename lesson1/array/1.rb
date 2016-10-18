a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a.each { |el| puts el }

a.each { |el| puts el if el > 5 }

b = a.select(&:odd?)
puts b

a << 11
a.unshift(3)
