#!/usr/bin/ruby -Ku

ans = 0
for i in 1..3
  tmp = gets().split(/\s/).map{|t| t.to_i}
  ans += tmp[0] / 10 * tmp[1]
end

puts ans
