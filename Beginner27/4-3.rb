#!/usr/bin/ruby -Ku

x = gets().chomp.split(//)

score = Array.new()
count = 0

x.each_with_index do |tmp, i|
  if tmp == "+"
    for j in 0..count-1
      score[j] += 1
    end
  end

  if tmp == "-"
    for j in 0..count-1
      score[j] -= 1
    end
  end

  if tmp == "M"
    count += 1
    score << 0
  end
end

if count == 0
  puts 0
else
  score.sort!
=begin
     
  plus = score[(count/2)..-1]
  minus = score[0..(count/2 - 1)]

  puts plus.inject(:+) + minus.inject(:+) * -1
=end
  ans = 0
  for i in 0..(count/2 -1)
    ans -= score[i]
  end
  for i in (count/2)..count-1
    ans += score[i]
  end
  puts ans
end
