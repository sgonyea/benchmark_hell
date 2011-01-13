require 'benchmark'

iters = 1000000

LAMB2 = lambda {|var1, var2|
  var1 << var2
}

module Blah
  def self.test(val)
    
  end

  def self.blah(val, &block)
    
  end
end

Blah.blah &LAMB2
