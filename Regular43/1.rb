#!/usr/bin/ruby -Ku

n, a, b = gets().chomp.split(/\s/).map{|t| t.to_i}
x = Array.new(n)
tmp = 0

n.times do |t|
  x[t] = gets().to_i
  tmp += x[t]
end

p = b.to_f / (x.max - x.min)

q = a - (tmp * p) / n

if (x.max - x.min) == 0
  puts -1
else
  puts "#{p} #{q}"
end
