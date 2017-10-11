#!/usr/bin/ruby -Ku

n, s, t = gets().split(/\s/).map{|t|  t.to_i}
w = gets().to_i
counter = 0

counter += 1 if s <= w && w <= t

for i in 1..n-1
  w += gets().to_i
  counter += 1 if s <= w && w <= t
end

puts counter
