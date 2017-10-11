#!/usr/bin/ruby -Ku

def get_parent(x, ar)
  if ar[x] == x
    return x
  else
    ar[x] = get_parent(ar[x], ar)
    return ar[x]
  end
end

def union(x, y, ar)
  px = get_parent(x, ar)
  py = get_parent(y, ar)
  ar[py] = px
end

n, m = gets().split(/\s/).map{|t| t.to_i}

uf = Array.new(n)

n.times do |i|
  uf[i] = i
end

for i in 1..m
  a, b = gets().split(/\s/).map{|t| t.to_i}
  union(a-1, b-1, uf)
end

ans = 0
for i in 0..n-1
  if uf[i] == i
    ans += 1
  end
end

puts ans-1

