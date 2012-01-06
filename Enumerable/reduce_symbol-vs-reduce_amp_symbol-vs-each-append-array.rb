require 'benchmark'

nums  = (1..20).to_a
iters = 100_000

puts 'reduce(:sym) vs. reduce(&:sym) vs. each{ |x| i += x }'
Benchmark.bmbm do |x|
  x.report('reduce(:sym)') do
    iters.times.each do
      nums.reduce(:+)
    end
  end

  x.report('reduce(&:sym)') do
    iters.times.each do
      nums.reduce(&:+)
    end
  end

  x.report('each{ |x| i += x }') do
    iters.times.each do
      i = 0
      nums.each { |n| i += n }
    end
  end
end
