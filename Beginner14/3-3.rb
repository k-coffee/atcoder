#!/usr/bin/ruby -Ku

ans = Array.new(1000002, 0)
n = gets().to_i

for i in 0..n-1
  a, b = gets().split(/\s/).map(&:to_i)
  ans[a] += 1
  ans[b+1] -= 1
end

max = 0
sum = 0
ans.each do |x|
  sum += x
  if max < sum
    max = sum
  end
end

puts max
