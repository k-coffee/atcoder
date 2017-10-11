#!/usr/bin/ruby -Ku

n, min, max = gets().split(/\s/).map{|t| t.to_i}
point = 0

n.times do |i|
  tmp = gets().split(/\s/)
  move = tmp[1].to_i
  move = min if move < min
  move = max if move > max
  if tmp[0] == "East"
    point += move
  else
    point -= move
  end
end

if point > 0
  puts "East #{point}"
elsif point < 0
  puts "West #{point.abs}"
else
  puts 0
end
