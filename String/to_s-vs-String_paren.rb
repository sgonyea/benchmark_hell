require 'benchmark'

iters = 1000

puts 'Integer(num) vs. num.to_i'
Benchmark.bmbm do |x|
  x.report('.to_s') do
    iters.times do
      iters.to_s
    end
  end

  x.report('String#()') do
    iters.times do
      String(iters)
    end
  end
end
