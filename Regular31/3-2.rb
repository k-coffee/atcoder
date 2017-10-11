#!/usr/bin/ruby -Ku

$N = gets().to_i
block = gets().split(/\s/).map{|t| t.to_i}
sort_key = Array.new($N)
for i in 0..$N-1
  sort_key[i] = i
end

$tree = Array.new($N+1, 0)

def add_t(pos, num)
  x = pos
  while x < $N + 1
    $tree[x] += num
    x += x & -x
  end
end

def sum_t(point)
  sum = 0
  x = point
  while x > 0
    sum += $tree[x]
    x -= x & -x
  end
  return sum
end

for i in 1..$N
  add_t(i, 1)
end

ans = 0
sort_key.sort_by{|i| block[i]}.each do |pos|
  add_t(pos+1, -1)
  tmp = sum_t(pos + 1)
  ans += [tmp, sum_t($N) - tmp].min
end

puts ans
