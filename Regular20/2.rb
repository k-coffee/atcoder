#!/usr/bin/ruby

x = gets().split(/\s/)
ans = 99999999999999999
num = x[0].to_i
cost = x[1].to_i
paper = Array.new()
color = [1,2,3,4,5,6,7,8,9,10]

for i in 1..num
  x = gets().to_i 
  paper << x
end

color.combination(2).each do |set|
  total = 0 
  paper.each_with_index do |tmp, i|
    if i % 2 == 0 
      total += cost if tmp != set[0]
    else
      total += cost if tmp != set[1]
    end
  end
  ans = total if total < ans
  total = 0

  paper.each_with_index do |tmp, i|
    if i % 2 == 0 
      total += cost if tmp != set[1]
    else
      total += cost if tmp != set[0]
    end
  end
  
  ans = total if total < ans
end

puts ans
