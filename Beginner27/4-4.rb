#!/usr/bin/ruby -Ku

x = gets().chomp.split(//)

score = Array.new()
point = 0
count = 0

x.each_with_index do |tmp, i|
  if tmp == "+"
    point += 1
  end

  if tmp == "-"
    point -= 1
  end

  if tmp == "M"
    count += 1
    score << point
  end
end

if count == 0
  puts 0
else
  score.sort!
  plus = score[(count/2)..-1]
  minus = score[0..(count/2 - 1)]

  puts plus.inject(:+) + minus.inject(:+) * -1
end
