require 'benchmark'

iters = 1_000_000

string1 = "OMG A STRING"
string2 = "OMG ANOTHER STRING"

puts 'appending vs interpolation'
Benchmark.bmbm do |x|
  x.report('appending') do
    iters.times.each do
      '<' << string1 << ',' << string2 << '>'
    end
  end

  x.report('interpolation') do
    iters.times.each do
      "<#{string1},#{string2}>"
    end
  end
end
