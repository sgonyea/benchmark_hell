require 'benchmark'

iters = 10_000_000

@str = "OMG A STRING"

def do_return
  return @str
end

def last_statement
  @str
end

puts 'return vs. last-statement'
Benchmark.bmbm do |x|
  x.report('return') do
    iters.times.each do
      do_return
    end
  end

  x.report('last-stmt') do
    iters.times.each do
      last_statement
    end
  end
end
