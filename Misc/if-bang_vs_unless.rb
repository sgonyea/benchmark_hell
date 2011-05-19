require 'benchmark'

iters = 1_000_000

string = "OMG A STRING"

puts 'if-bang vs. unless'
Benchmark.bmbm do |x|
  x.report('if-bang') do
    iters.times.each do
      'hi' if ! string.respond_to?(:to_s)
    end
  end

  x.report('unless') do
    iters.times.each do
      'hi' unless string.respond_to?(:to_s)
    end
  end
end
