#!/usr/bin/ruby -Ku

x = gets().chomp.split(//)
n = gets().to_i
m = x.size

for i in 1..n
  a, b = gets().split(/\s/).map{|t| t.to_i}
  for j in 0..(b-a)/2
    tmp = x[j+a-1]
    x[j+a-1] = x[b-j-1]
    x[b-j-1] = tmp
  end
end

puts x.join
