#!/usr/bin/ruby -Ku

ans = 0
n, x = gets().split(/\s/).map{|t| t = t.to_i}
a = gets().split(/\s/).map{|t| t = t.to_i}

for i in 0..n-1
  ans += a[i] * (x & 0x01)
  x = x >> 1
end

puts ans
