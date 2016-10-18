array = (1..10).to_a

array.each { |e| puts e }

puts array.select { |e| e > 5 }

odd_numbers = array.select(&:odd?)
puts odd_numbers

array << 11
array.unshift(3)
