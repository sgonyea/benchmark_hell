require 'benchmark'

iters = 1_000_000

true_val  = true
false_val = false
nil_val   = nil

def stmt(val)
  :a_return_value
end

puts 'stmt(val) if val -vs- val && stmt(val)'
Benchmark.bmbm do |x|
  x.report('stmt(val) if val (true)') do
    iters.times do
      stmt(true_val) if true_val
    end
  end

  x.report('stmt(val) if val (true e)') do
    iters.times do
      stmt(true_val) if true_val
    end
  end

  x.report('val && stmt(val) (true e)') do
    iters.times do
      true_val && stmt(true_val)
    end
  end

  x.report('val && stmt(val) (true)') do
    iters.times do
      true_val && stmt(true_val)
    end
  end

  x.report('stmt(val) if val (false)') do
    iters.times do
      stmt(false_val) if false_val
    end
  end

  x.report('val && stmt(val) (false)') do
    iters.times do
      false_val && stmt(false_val)
    end
  end

  x.report('stmt(val) if val (nil)') do
    iters.times do
      stmt(nil_val) if nil_val
    end
  end

  x.report('val && stmt(val) (nil)') do
    iters.times do
      nil_val && stmt(nil_val)
    end
  end
end
