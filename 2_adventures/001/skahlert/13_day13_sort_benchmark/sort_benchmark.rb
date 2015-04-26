require 'benchmark'
a = (1..100000).map { (1..rand(120)).map{ (65 + rand(25)).chr}.join("") }
Benchmark.bm(10) do |b|
  b.report("Sort")    { a.sort{|a,b| a.length <=> b.length} }
  b.report("Sort by") { a.sort_by { |a| a.length } }
end
