sum = 0

a = Array.new(4) { Array.new(4) { rand(-10..10) } }
p a

a.flatten.each do |el|
  if el < 0
    sum += el
    puts el
  end
end

puts "\nSum of negative numbers: #{sum}"
