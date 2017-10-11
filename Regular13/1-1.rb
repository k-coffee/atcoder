#!/usr/bin/ruby -Ku

a = gets().chomp
main = a.split(/\s/).map{|x| x = x.to_i}
a = gets().chomp
sub = a.split(/\s/).map{|x| x = x.to_i}

max = 0
[0, 1, 2].permutation(3).each do |tmp|
  x = (main[0] / sub[tmp[0]]).to_i
  y = (main[1] / sub[tmp[1]]).to_i
  z = (main[2] / sub[tmp[2]]).to_i

  if max < x * y * z
    max = x * y * z
  end
end

puts max
