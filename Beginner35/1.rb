#!/usr/bin/ruby -Ku

a, b = gets.split(/\s/).map{|t| t.to_i}

if b % a != 0
  puts (b / a) + 1
else
  puts b / a
end
