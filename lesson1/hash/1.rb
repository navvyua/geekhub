def cal_fib(n)
  n < 3 ? 1 : cal_fib(n - 1) + cal_fib(n - 2)
end

hash = {}
i = 1

(:a..:z).each do |e|
  hash[e] = cal_fib(i)
  i += 1
end

hash.each_pair { |k, v| puts "#{k}: #{v}" if v < 15 }
