array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.each { |el| puts el }

array.each { |el| puts el if el > 5 }

odd_numbers = array.select(&:odd?)
puts odd_numbers

array << 11
array.unshift(3)
