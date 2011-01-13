require 'benchmark'

class << Random; end

class << self
  attr_reader :count
end

iters = 100
count = 1000

def get_rand(size=count)
  rand(size)
end

num   = get_rand
array = count.times.map {
          get_rand
        }.insert(get_rand, num)

puts 'include? vs. grep, fight!'
Benchmark.bmbm do |x|
  x.report('grep') do
    iters.times.each do
      array.grep num
    end
  end

  x.report('include?') do
    iters.times.each do
      array.include? num
    end
  end
end
