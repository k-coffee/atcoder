#!/usr/bin/ruby -Ku

max = 1000000000
n, m = gets.split(/\s/).map(&:to_i)
mymap = Array.new(n).map{|t| t = Array.new(n, max)}
first_pos = Array.new()
ans = max

for i in 1..m
  u, v, l = gets.split(/\s/).map(&:to_i)
  mymap[u-1][v-1] = l
  mymap[v-1][u-1] = l
end

for i in 0..n-1
  first_pos << i unless mymap[0][i] == max
  mymap[i][i] = 0
end

for k in 1..n-1
  for i in 1..n-1
    for j in 1..n-1
      mymap[i][j] = [mymap[i][j], mymap[i][k] + mymap[k][j]].min
    end
  end
end

first_pos.combination(2).each do |a, b|
  tmp = mymap[a][b] + mymap[0][a] + mymap[0][b]
  ans = tmp if ans > tmp
end

if ans >= max
  puts -1
else
  puts ans
end

