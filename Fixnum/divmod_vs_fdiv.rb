require 'benchmark'

iters = 100000

puts 'Fixnum#divmod vs. Fixnum#fdiv'
Benchmark.bmbm do |x|
  x.report('#divmod') do
    iters.times do
      1302390897057612.divmod(1000000)
    end
  end

  x.report('#fdiv') do
    iters.times do
      1302390897057612.fdiv(1000000)
    end
  end

  x.report('Time at #divmod') do
    iters.times do
      Time.at(*1302390897057612.divmod(1000000))
    end
  end

  x.report('Time at #fdiv') do
    iters.times do
      Time.at(1302390897057612.fdiv(1000000))
    end
  end
end

# benchmark_hell$ rvm exec "echo; echo; ruby -v && ruby Fixnum/divmod_vs_fdiv.rb"
#
#
# jruby 1.6.0 (ruby 1.8.7 patchlevel 330) (2011-03-15 f3b6154) (Java HotSpot(TM) 64-Bit Server VM 1.6.0_24) [darwin-x86_64-java]
# Fixnum#divmod vs. Fixnum#fdiv
# Rehearsal ---------------------------------------------------
# #divmod           0.207000   0.000000   0.207000 (  0.159000)
# #fdiv             0.068000   0.000000   0.068000 (  0.068000)
# Time at #divmod   0.308000   0.000000   0.308000 (  0.308000)
# Time at #fdiv     0.097000   0.000000   0.097000 (  0.097000)
# ------------------------------------------ total: 0.680000sec
# 
#                       user     system      total        real
# #divmod           0.014000   0.000000   0.014000 (  0.014000)
# #fdiv             0.008000   0.000000   0.008000 (  0.008000)
# Time at #divmod   0.059000   0.000000   0.059000 (  0.059000)
# Time at #fdiv     0.032000   0.000000   0.032000 (  0.032000)
# 
# 
# rubinius 1.2.3 (1.8.7 release 2011-03-15 JI) [x86_64-apple-darwin10.6.0]
# Fixnum#divmod vs. Fixnum#fdiv
# Rehearsal ---------------------------------------------------
# #divmod           0.056868   0.002004   0.058872 (  0.145189)
# #fdiv             0.031987   0.000278   0.032265 (  0.035672)
# Time at #divmod   0.092316   0.000522   0.092838 (  0.176190)
# Time at #fdiv     0.108996   0.000367   0.109363 (  0.270009)
# ------------------------------------------ total: 0.293338sec
# 
#                       user     system      total        real
# #divmod           0.018734   0.000101   0.018835 (  0.018863)
# #fdiv             0.010798   0.000037   0.010835 (  0.010873)
# Time at #divmod   0.065262   0.000343   0.065605 (  0.065706)
# Time at #fdiv     0.102991   0.000308   0.103299 (  0.103813)
# 
# 
# ruby 1.8.7 (2011-02-18 patchlevel 334) [i686-darwin10.6.0]
# Fixnum#divmod vs. Fixnum#fdiv
# Rehearsal ---------------------------------------------------
# #divmod           0.100000   0.000000   0.100000 (  0.105922)
# #fdiv             0.050000   0.000000   0.050000 (  0.051386)
# Time at #divmod   0.140000   0.000000   0.140000 (  0.134710)
# Time at #fdiv     0.100000   0.000000   0.100000 (  0.101932)
# ------------------------------------------ total: 0.390000sec
# 
#                       user     system      total        real
# #divmod           0.070000   0.000000   0.070000 (  0.068703)
# #fdiv             0.040000   0.000000   0.040000 (  0.041701)
# Time at #divmod   0.160000   0.000000   0.160000 (  0.164749)
# Time at #fdiv     0.110000   0.000000   0.110000 (  0.116851)
# 
# 
# ruby 1.9.2p180 (2011-02-18 revision 30909) [x86_64-darwin10.6.0]
# Fixnum#divmod vs. Fixnum#fdiv
# Rehearsal ---------------------------------------------------
# #divmod           0.030000   0.000000   0.030000 (  0.028808)
# #fdiv             0.020000   0.000000   0.020000 (  0.019878)
# Time at #divmod   0.140000   0.000000   0.140000 (  0.135287)
# Time at #fdiv     0.210000   0.000000   0.210000 (  0.212905)
# ------------------------------------------ total: 0.400000sec
# 
#                       user     system      total        real
# #divmod           0.020000   0.000000   0.020000 (  0.022134)
# #fdiv             0.020000   0.000000   0.020000 (  0.019138)
# Time at #divmod   0.130000   0.000000   0.130000 (  0.133372)
# Time at #fdiv     0.220000   0.000000   0.220000 (  0.218259)
