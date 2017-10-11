#!/usr/bin/ruby -Ku

n, m, p, q, r = gets().split(/\s/).map{|t| t.to_i}

scores = Array.new(n).map{|t| t = Array.new(m, 0)}

r.times do |tmp|
  x, y, z = gets().split(/\s/).map{|t| t.to_i}
  scores[x-1][y-1] = z
end

max = 0
(0...m-1).to_a.combination(q).each do |tmp|
  hoge = Array.new()
  scores.each do |x|
    s = 0
    tmp.each do |t|
      s += x[t]
    end
    hoge << s
  end
  foo = hoge.sort{|a, b| b <=> a}[0..p-1].inject(:+)
  max = foo if max < foo
end

p max
