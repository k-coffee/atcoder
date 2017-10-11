#!/usr/bin/ruby -Ku

counter = 0
right = Array.new()
left = Array.new()

n = gets().to_i
total = Array.new(n, 0)

for i in 1..n
  tmp = gets().to_i
  right << tmp
end

left = right.reverse


for i in 0..n-2
  if (right[i] - right[i+1]) >= 0
    counter = i if counter < 0
    for j in counter..i
      total[j] += 1
    end
  else
    counter = -1
  end
end

counter = 0
for i in 0..n-2
  if (left[i] - left[i+1]) >= 0
    counter = i if counter < 0
    for j in counter..i
      total[n-j-1] += 1
    end
  else
    counter = -1
  end
end

total.each do |x|
  puts x
end
