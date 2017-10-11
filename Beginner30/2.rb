#!/usr/bin/ruby -Ku

n, m = gets.split(/\s/).map{|t| t.to_i}

if n >= 12
  n -= 12
end

x = (n * 60 + m) * 0.5
y = m * 6.0

if y > x
  tmp = x
  x = y
  y = tmp
end

tmp = x - y
if tmp > 180
  ans = (360 + y) - x
else
  ans = tmp
end

puts ans
