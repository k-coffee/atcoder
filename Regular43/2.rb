#!/usr/bin/ruby -Ku

n = gets().to_i
x = Array.new(4).map{|t| t = Array.new(n, 0)}
y = Array.new()

n.times do |t|
  y << gets.to_i
end

y.sort!

for i in 0..n-1
  x[0][i] = 1
end

for i in 1..3
  for j in 0..n-1
    for k in j+1..n-1
      if y[j] * 2 <= y[k]
        tmp = x[i-1][k..-1]
        x[i][j] = tmp.inject(:+)
        break
      end
    end
  end
end

puts x[3].inject(:+) % 1000000007
