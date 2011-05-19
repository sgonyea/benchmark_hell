require 'benchmark'

iters = 2_000

puts 'Hash[Enumerable#map] vs Enumerable#inject({}) vs @var stuffing'
Benchmark.bmbm do |x|
  x.report('Hash[Array#map]') do
    iters.times.each do
      Hash[ iters.times.map{|x| [x, x ** 2]} ]
    end
  end

  x.report('inject({})') do
    iters.times.each do
      iters.times.inject({}) {|h, x|
        h[x] = x ** 2
        h
      }
    end
  end

  x.report('@var stuffing') do
    iters.times.each do
      @var = {}
      iters.times.each {|x|
        @var[x] = x ** 2
      }
    end
  end
end
