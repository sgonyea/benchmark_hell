require 'benchmark'

iters = 1000
hash  = {
  'some_key' => 'some_val'
}

puts 'Hash#has_key vs. Hash#[]'
Benchmark.bmbm do |x|
  x.report('Hash#has_key') do
    iters.times.each do
      hash.has_key? 'some_key'
    end
  end

  x.report('Hash#has_key (if statement)') do
    iters.times.each do
      if hash.has_key?('other_key')
        "hooray!"
      end
    end
  end

  x.report('Hash#has_key (non-existant)') do
    iters.times.each do
      hash.has_key? 'other_key'
    end
  end

  x.report('Hash#[]') do
    iters.times.each do
      hash['some_key']
    end
  end

  x.report('Hash#[] (if statement)') do
    iters.times.each do
      if hash['some_key']
        "hooray!"
      end
    end
  end

  x.report('Hash#[] (non-existant)') do
    iters.times.each do
      hash['other_key']
    end
  end
end
