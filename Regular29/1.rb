#!/usr/bin/ruby -Ku

x = gets().to_i
y = Array.new()
ans = 1000000
for i in 1..x
  y << gets().to_i
end

for i in 1..(1<<x)-1
  g1 = 0
  g2 = 0
  for j in 0..x-1
    if (i & (1<<j) ) != 0
      g1 += y[j]
    else
      g2 += y[j]
    end
  end
  if ans > [g1, g2].max
    ans =  [g1, g2].max
  end
end

puts ans
