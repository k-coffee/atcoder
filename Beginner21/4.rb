#!/usr/bin/ruby -Ku

n = gets.to_i
k = gets.to_i

score = Array.new(k).map{|t| t = Array.new(n, 0)}

n.times do |i|
  score[0][i-1] = 1
end

for i in 1..k-1
  for j in 0..n-1
    tmp = 0
    for x in j..n-1
      tmp += score[i-1][x]
    end
    score[i][j] = tmp
  end
end

ans = 0
score[k-1].each do |t|
  ans += t
end

puts ans % 1000000007
