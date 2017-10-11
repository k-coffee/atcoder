#!/usr/bin/ruby -Ku

x = gets().chomp.to_i

y = 100 * (x / 10)
x %= 10

if x >= 7
  y += 100
else
  y += x * 15
end

puts y
