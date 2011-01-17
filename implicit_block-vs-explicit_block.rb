require 'benchmark'

iters = 10000

def do_explicit(&block)
  var = "hello"
  block.call(var)
end

def do_implicit
  var = "hello"
  yield(var)
end

puts 'explicit block vs implicit'
Benchmark.bmbm do |x|
  x.report('explicit') do
    iters.times.each do
      do_explicit {|var|
        var << "goodbye"
      }
    end
  end

  x.report('implicit') do
    iters.times.each do
      do_implicit {|var|
        var << "goodbye"
      }
    end
  end
end
