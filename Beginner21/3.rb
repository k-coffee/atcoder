#!/usr/bin/ruby -Ku

n = gets.to_i
a, b = gets.split(/\s/).map{|t| t.to_i}
m = gets.to_i
mapdata = Array.new(n).map{|t| t = Array.new()}

for i in 1..m
  tmp = gets.split(/\s/).map{|t| t.to_i}
  mapdata[tmp[0]-1] << tmp[1]-1
  mapdata[tmp[1]-1] << tmp[0]-1
end

flag = true
score = Array.new(n, 0)
score[b-1] = 1
stack = Array.new()
stack << b-1

while flag
  tmp = Marshal.load(Marshal.dump(stack))
  tmpscore = Marshal.load(Marshal.dump(score))
  stack = Array.new()

  tmp.each do |point|
    if point == a-1
      flag = false
      score = tmpscore
      break
    end
    stack << mapdata[point]
    mapdata[point].each do |t|
      score[t] += tmpscore[point]
    end
  end
  stack = stack.flatten.uniq
end

puts score[a-1] % 1000000007
