weather = []
weather_strings = Array.new(40) do
  format('%02d.%02d %d', rand(1..30), rand(1..12), rand(-30..30))
end

weather_strings.each do |str|
  day = str[0..1].to_i
  month = str[3..4].to_i
  temperature = str[6..-1].to_i
  weather << { day: day, month: month, temperature: temperature }
end

(1..12).each do |month|
  month_weather = weather.select { |e| e[:month] == month }
  size = month_weather.size

  if size.zero?
    puts "No data for month #{month}".center(40, '-')
  else
    sum = 0
    month_weather.each { |e| sum += e[:temperature] }

    puts "Avarage temperature for month #{month} is #{sum / size}"
  end
end
