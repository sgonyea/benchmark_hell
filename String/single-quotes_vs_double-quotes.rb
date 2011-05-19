require 'benchmark'

iters = 10_000_000

puts 'single vs double'
Benchmark.bmbm do |x|
  x.report('single') do
    iters.times.each do
      'OMG I AM A STRING'
    end
  end

  x.report('double') do
    iters.times.each do
      "OMG I AM A STRING"
    end
  end
end
