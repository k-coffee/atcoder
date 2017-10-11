#!/usr/bin/ruby -Ku

a, b, c, d = gets.split(/\s/).map{|t| t.to_f}

x = b / a
y = d / c

if x > y
  puts "TAKAHASHI"
elsif x < y
  puts "AOKI"
else
  puts "DRAW"
end
