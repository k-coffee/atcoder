#!/usr/bin/ruby -Ku

name = ""
max = 0
count = 0
n = gets.to_i

for i in 1..n
  x = gets.chomp.split
  if max < x[1].to_i
    max = x[1].to_i
    name = x[0]
  end
  count += x[1].to_i
end

if count / 2 < max
  puts name
else
  puts "atcoder"
end
