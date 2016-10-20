def calc_fib(n)
  n < 3 ? 1 : calc_fib(n - 1) + calc_fib(n - 2)
end

hash = {}

(:a..:z).each_with_index { |e, i| hash[e] = calc_fib(i + 1) }

hash.each_pair { |k, v| puts "#{k}: #{v}" if v < 15 }
