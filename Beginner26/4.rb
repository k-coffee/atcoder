#!/usr/bin/ruby -Ku

a, b, c = gets().split(/\s/).map{|t| t.to_i}

t = 1.0
th = 0.00000001
tmp = 0
min = 0
max = 100000

while (100 - tmp).abs > th 
  t = (max + min) / 2.0
  tmp = a * t + b * Math.sin(c * t * Math::PI)

  if tmp > 100
    max = t
  else
    min = t
  end
end

puts t
