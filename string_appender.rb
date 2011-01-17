require 'benchmark'

iters = 10000

string1 = "Test"
string2 = "String"
string3 = "Appending"

puts 'String ranged index vs. "coordinates"'
Benchmark.bmbm do |x|
  x.report('in units') do
    iters.times.each do
      "Go!" << " " << string1 << " " << string2 << " << " << string3
    end
  end

  x.report('as a chunk') do
    iters.times.each do
      "Go!" << %Q[ #{string1} #{string2} << #{string3}]
    end
  end
end
