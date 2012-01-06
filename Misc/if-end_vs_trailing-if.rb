require 'benchmark'

iters = 10_000_000

string = "OMG A STRING"

puts 'if-end vs. trailing-if'
Benchmark.bmbm do |x|
  x.report('if-end') do
    iters.times do
      if string.respond_to?(:to_s)
        string
      end
    end
  end

  x.report('trailing') do
    iters.times do
      string if string.respond_to?(:to_s)
    end
  end
end
