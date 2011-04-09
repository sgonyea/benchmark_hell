require 'benchmark'

iters = 100000

puts 'Fixnum#divmod vs. Fixnum#fdiv'
Benchmark.bmbm do |x|
  x.report('#divmod') do
    iters.times.each do
      1302390897057612.divmod(1000000)
    end
  end

  x.report('#fdiv') do
    iters.times.each do
      1302390897057612.fdiv(1000000)
    end
  end

  x.report('Time at #divmod') do
    iters.times.each do
      Time.at(*1302390897057612.divmod(1000000))
    end
  end

  x.report('Time at #fdiv') do
    iters.times.each do
      Time.at(1302390897057612.fdiv(1000000))
    end
  end
end

# Fixnum#divmod vs. Fixnum#fdiv
# Rehearsal ---------------------------------------------------
# #divmod           0.030000   0.000000   0.030000 (  0.028903)
# #fdiv             0.020000   0.000000   0.020000 (  0.024558)
# Time at #divmod   0.180000   0.000000   0.180000 (  0.179770)
# Time at #fdiv     0.280000   0.010000   0.290000 (  0.279873)
# ------------------------------------------ total: 0.520000sec
# 
#                       user     system      total        real
# #divmod           0.030000   0.000000   0.030000 (  0.033413)
# #fdiv             0.020000   0.000000   0.020000 (  0.024257)
# Time at #divmod   0.180000   0.000000   0.180000 (  0.179871)
# Time at #fdiv     0.270000   0.000000   0.270000 (  0.269403)
