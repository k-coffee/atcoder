#!/usr/bin/ruby -Ku

n, k = gets().split(/\s/).map{|t| t.to_i}
tmp = 0
ans = 0

for i in 1..n
  tmp += gets().to_i
  ans = i if tmp < k
end

puts ans + 1
