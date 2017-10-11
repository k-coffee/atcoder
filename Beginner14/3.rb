#!/usr/bin/ruby -Ku

ans = Array.new(1000001, 0)
x = gets().to_i

for i in 0..x-1
  s, t = gets().split(/\s/).map{|t| t = t.to_i}
  for j in s..t
    ans[j] += 1
  end
end

puts ans.max
