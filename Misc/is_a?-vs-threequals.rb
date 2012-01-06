require 'benchmark'

iters = 100_000

string = "OMG A STRING"

puts '.is_a?(String) vs. String === val'
Benchmark.bmbm do |x|
  x.report('.is_a?') do
    iters.times do
      string.is_a?(String)
    end
  end

  x.report('String === val') do
    iters.times do
      String === string
    end
  end
end
