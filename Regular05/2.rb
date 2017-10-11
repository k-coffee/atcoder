#!/usr/bin/ruby -Ku

x = gets().chomp.split(/\s/)
n, va, vb, l = x.map{|i| i=i.to_f}

nextlen = l

for i in 1..n
  t = nextlen / va
  nextlen = vb * t
end

puts nextlen
