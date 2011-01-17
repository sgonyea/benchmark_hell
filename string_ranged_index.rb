require 'benchmark'

string = "Test String OMG"

puts 'String ranged index vs. "coordinates"'
Benchmark.bmbm do |x|
  x.report('ranged index') do
    iters.times.each do
      text = string[2..9]
    end
  end

  x.report('coordinates') do
    iters.times.each do
      text = string[2, 9]
    end
  end
end
