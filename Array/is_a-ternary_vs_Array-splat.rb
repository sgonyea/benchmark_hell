require 'benchmark'

iters   = 1_000_000
string  = 'test string'
array   = [string]

puts 'Ternary is_a?(Array) vs. [*Object]'
Benchmark.bmbm do |x|
  x.report('string #is_a?+3nary') do
    iters.times do
      string.is_a?(Array) ? string : [string]
    end
  end

  x.report('string [*Object]') do
    iters.times do
      [*string]
    end
  end

  x.report('array  #is_a?+3nary') do
    iters.times do
      array.is_a?(Array) ? array : [array]
    end
  end

  x.report('array  [*Object]') do
    iters.times do
      [*array]
    end
  end
end
