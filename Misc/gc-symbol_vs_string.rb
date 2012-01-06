require 'benchmark'

str1 = "str1"
str2 = "str2"

iters = 1000000

puts 'Benchmark: Variable Interpolation'
Benchmark.bmbm do |x|
  x.report('symbol') do
    iters.times do
      :"A#{str1}:C#{str2}"
    end
  end

  x.report('string') do
    iters.times do
      "A#{str1}:C#{str2}"
    end
  end
end
