#!/usr/bin/ruby -Ku

x = gets().split(/\s/).map{|t| t.to_i}

if x[0] < x[1]
  puts "Better"
else
  puts "Worse"
end
