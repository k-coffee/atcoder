#!/usr/bin/ruby -Ku

n = gets.to_i
a = Array.new()
b = Hash.new()

for i in 1..n
  a << gets.to_i
end

t = a.uniq.sort

t.each_with_index do |x, i|
  b[x] = i
end

a.each do |x|
  puts b[x]
end
