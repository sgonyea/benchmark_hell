require 'benchmark'

iters = 1000

def do_block1
  var = "hello"
  block_given? && yield(var) || var << "goodbye"
end

def do_block2
  var = "hello"
  if block_given?
    yield(var)
  else
    var << "goodbye"
  end
end

def do_block3
  var = "hello"
  (block_given?) ? yield(var) : var << "goodbye"
end

puts 'Integer(num) vs. num.to_i'
Benchmark.bmbm do |x|
  x.report('block_given? && yield(var) || var << "goodbye"') do
    iters.times.each do
      do_block1
    end
  end

  x.report('if block_given?') do
    iters.times.each do
      do_block2
    end
  end

  x.report('ternary') do
    iters.times.each do
      do_block3
    end
  end
end
