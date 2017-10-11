#!/usr/bin/ruby -Ku

ans = 0
n, m = gets().split(/\s/).map{|t| t.to_i}
j = Array.new(m+1, 0)

n.times do |x|
  s, e, r = gets().split(/\s/).map{|t| t.to_i}
  j[s-1] += r
  j[e] -= r
  ans += r
end

tmp_max = ans - j[0]
tmp = 0

for i in 0..j.size-2
  tmp += j[i]
  if (ans - tmp) > tmp_max
    tmp_max = ans - tmp
  end
end

puts tmp_max
