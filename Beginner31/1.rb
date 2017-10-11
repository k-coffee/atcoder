#!/usr/bin/ruby -Ku

a, d = gets.split(/\s/).map{|t| t.to_i}

x = (a + 1) * d
y = a * (d + 1)

if x > y
  puts x
else
  puts y
end
