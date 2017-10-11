#!/usr/bin/ruby -Ku

n = gets().to_i
points = Array.new()
right = Array.new(n+2, 0)
left = Array.new(n+2, 0)

for i in 1..n
  points[i] = gets().to_i
end

points[0] = 100001
points[n+1] = 100001

i = n

while (i > 0)
  tmp = i+1
  while (1)
    if (points[tmp] > points[i])
      break
    end
    tmp = right[tmp]
  end

  right[i] = tmp
  i -= 1
end


i = 1
while (i <= n)
  tmp = i-1
  while (1)
    if (points[tmp] > points[i])
      break
    end
    tmp = left[tmp]
  end

  left[i] = tmp
  i += 1
end

for i in 1..n
  puts (right[i] - left[i] - 2)
end
