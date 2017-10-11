#!/usr/bin/ruby -Ku

x = gets().chomp.to_i

score = Array.new(9, "")

for i in 1..x
  tmp = gets().chomp.split(//)
  tmp.each_with_index do |n, j|
    score[j] += n
  end
end

point = 0
for i in 0..8
  score[i] = score[i].gsub(/o+/, "o").gsub(".", "")
  point += score[i].size
end

puts point
