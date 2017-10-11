#!/usr/bin/ruby -Ku

x = gets().to_i
y = gets().to_i

if x % y == 0
  puts 0
else
  puts y - (x % y)
end
