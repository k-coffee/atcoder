#!/usr/bin/ruby -Ku

w, h = gets().split(/\s/).map{|t| t.to_i}
counter = Array.new(w).map{|t| t = Array.new(h, 0)}
stack = Array.new()

counter[0][0] = 1

for i in 0..(w-1)
  for j in 0..(h-1)
    counter[i][j+1] += counter[i][j] if (j+1) < h
    counter[i+1][j] += counter[i][j] if (i+1) < w
  end
end

puts counter[w-1][h-1] % 1000000007
