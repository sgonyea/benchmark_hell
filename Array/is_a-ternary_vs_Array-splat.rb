require 'benchmark'

iters   = 1_000_000
string  = 'test string'
array   = [string]

puts 'Ternary is_a?(Array) vs. [*Object]'
Benchmark.bmbm do |x|
  x.report('string #is_a?+3nary') do
    iters.times.each do
      string.is_a?(Array) ? string : [string]
    end
  end

  x.report('string [*Object]') do
    iters.times.each do
      [*string]
    end
  end

  x.report('array  #is_a?+3nary') do
    iters.times.each do
      array.is_a?(Array) ? array : [array]
    end
  end

  x.report('array  [*Object]') do
    iters.times.each do
      [*array]
    end
  end
end
