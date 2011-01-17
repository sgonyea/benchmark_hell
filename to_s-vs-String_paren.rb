require 'benchmark'

iters = 1000

puts 'Integer(num) vs. num.to_i'
Benchmark.bmbm do |x|
  x.report('.to_s') do
    iters.times.each do
      iters.to_s
    end
  end

  x.report('String#()') do
    iters.times.each do
      String(iters)
    end
  end
end
