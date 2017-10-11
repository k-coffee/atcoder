#!/usr/bin/ruby -Ku

x = gets().chomp.to_i
count = 0

for i in 1..x
  z = 0
  y = gets().chomp.split(/\s/)
  y.each do |yy|
    z += yy.to_i
  end
  count += 1 if z < 20
end

puts count
