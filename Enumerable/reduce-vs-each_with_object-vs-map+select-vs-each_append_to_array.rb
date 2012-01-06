require 'benchmark'

nums  = (1..20).to_a
iters = 100_000

puts 'reduce vs. each_with_object vs. map + select vs. each { << to array }'
Benchmark.bmbm do |x|
  x.report('reduce') do
    iters.times {
      nums.reduce([]) do |out, num|
        num = num ** 2
        out << num if num > 12
        out
      end
    }
  end

  x.report('each_with_object') do
    iters.times {
      nums.each_with_object([]) do |num, out|
        num = num ** 2
        out << num if num > 12
      end
    }
  end

  x.report('map + select') do
    iters.times {
      squared = nums.map do |num|
        num ** 2
      end

      squared.select! { |num| num > 12 }
    }
  end

  x.report('each { << to array }') do
    iters.times {
      array = []

      nums.each do |num|
        num = num ** 2
        array << num if num > 12
      end
    }
  end
end

# me@s:~/workspace/benchmark_hell$ rvm use 1.9.2
# Using /Users/me/.rvm/gems/ruby-1.9.2-p290
# me@s:~/workspace/benchmark_hell$ ruby Enumerable/reduce-vs-each_with_object-vs-map+select-vs-each_append_to_array.rb
# reduce vs. each_with_object vs. map + select vs. each { << to array }
# Rehearsal --------------------------------------------------------
# reduce                 0.400000   0.000000   0.400000 (  0.394418)
# each_with_object       0.380000   0.000000   0.380000 (  0.385646)
# map + select           0.400000   0.000000   0.400000 (  0.396079)
# each { << to array }   0.330000   0.000000   0.330000 (  0.336147)
# ----------------------------------------------- total: 1.510000sec
# 
#                            user     system      total        real
# reduce                 0.390000   0.000000   0.390000 (  0.392355)
# each_with_object       0.380000   0.000000   0.380000 (  0.383008)
# map + select           0.400000   0.000000   0.400000 (  0.397857)
# each { << to array }   0.330000   0.010000   0.340000 (  0.333895)
# me@s:~/workspace/benchmark_hell$ rvm use rbx
# Using /Users/me/.rvm/gems/rbx-head
# me@s:~/workspace/benchmark_hell$ ruby Enumerable/reduce-vs-each_with_object-vs-map+select-vs-each_append_to_array.rb
# reduce vs. each_with_object vs. map + select vs. each { << to array }
# Rehearsal --------------------------------------------------------
# reduce                 0.563397   0.001874   0.565271 (  0.489911)
# each_with_object       0.443870   0.000287   0.444157 (  0.413253)
# map + select           0.725116   0.001611   0.726727 (  0.658130)
# each { << to array }   0.201239   0.000128   0.201367 (  0.188815)
# ----------------------------------------------- total: 1.937522sec
#
#                            user     system      total        real
# reduce                 0.379959   0.000060   0.380019 (  0.380009)
# each_with_object       0.397840   0.000086   0.397926 (  0.397936)
# map + select           0.540498   0.000113   0.540611 (  0.540603)
# each { << to array }   0.175187   0.000040   0.175227 (  0.175237)
