require 'benchmark'

iters = 1000

puts 'Integer(num) vs. num.to_i'
Benchmark.bmbm do |x|
  x.report('.to_i') do
    iters.times do
      "300".to_i
    end
  end

  x.report('Integer') do
    iters.times do
      Integer "300"
    end
  end
end
