require 'benchmark'

iters = 1000

comp  = "hello"
hello = "HelLo"

puts 'String#downcase == vs. String#casecmp'
Benchmark.bmbm do |x|
  x.report('String#downcase1') do
    iters.times.each do
      hello.downcase == comp
    end
  end

  x.report('String#downcase2') do
    iters.times.each do
      "HelLo".downcase == "hello"
    end
  end

  x.report('String#downcase3') do
    iters.times.each do
      var = "HelLo"
      var.downcase!
      var == "hello"
    end
  end

  x.report('casecmp1') do
    iters.times.each do
      hello.casecmp(comp).zero?
    end
  end

  x.report('casecmp1-1') do
    iters.times.each do
      hello.casecmp(comp) == 0
    end
  end

  x.report('casecmp2') do
    iters.times.each do
      "HelLo".casecmp(comp).zero?
    end
  end

  x.report('casecmp2-1') do
    iters.times.each do
      "HelLo".casecmp(comp) == 0
    end
  end
end
