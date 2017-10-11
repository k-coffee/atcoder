#!/usr/bin/ruby -Ku

n = gets.to_i
a, b = gets.split(/\s/).map{|t| t.to_i}
k = gets.to_i

m = gets.split(/\s/).map{|t| t.to_i}

m << a
m << b

tmp = m.size
if m.uniq.size == tmp
  puts "YES"
else
  puts "NO"
end
