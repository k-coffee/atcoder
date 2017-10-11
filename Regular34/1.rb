#!/usr/bin/ruby -Ku

n = gets().to_i

max = 0
n.times do |t|
  a,b,c,d,e = gets().split(/\s/).map{|x| x.to_i}
  tmp = a + b + c + d + e.to_f * 110 / 900
  max = tmp if max < tmp
end

puts max
