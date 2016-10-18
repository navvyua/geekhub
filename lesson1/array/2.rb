array = Array.new(4) { Array.new(4) { rand(-10..10) } }

sum = array.flatten!.select! { |e| e < 0 }.inject { |a, e| a + e }

puts "Sum of negative numbers: #{sum}"
puts 'Negative numbers:'
puts array
