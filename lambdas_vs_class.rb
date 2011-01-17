require 'benchmark'
require 'lorem'

iters = 1000000
text  = Lorem::Base.new('words', 10).output

LAMB2 = lambda {|var1, var2|
  var1 << var2
}

class << self
  def appender(var1, var2)
    var1 << var2
  end
end

APPENDER = :appender.to_proc

class Concatenator
  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def call(data)
    @string << data
  end
end

puts 'lambda vs. class vs. to_proc'
Benchmark.bmbm do |x|
  x.report('lambda') do
    output = ''
    iters.times.each do
      LAMB2.call(output, text)
    end
  end

  x.report('to_proc') do
    output = ''
    iters.times.each do
      APPENDER.call(self, output, text)
    end
  end

  x.report('class') do
    concat = Concatenator.new(output = '')
    iters.times.each do
      concat.call text
    end
  end
end
