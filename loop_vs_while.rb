require 'benchmark'

iters = 10000
count = 1000

puts 'loop vs. while true'
Benchmark.bmbm do |x|
  x.report('loop') do
    i = 0
    loop do
      break if i >= iters
      i += 1
    end
  end

  x.report('while true') do
    i = 0
    while true do
      break if i >= iters
      i += 1
    end
  end
end
