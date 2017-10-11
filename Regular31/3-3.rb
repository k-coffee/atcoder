#!/usr/bin/ruby -Ku

n = gets().to_i
block = gets().split(/\s/).map{|t| t.to_i}
sort_key = Array.new(n)

for i in 0..n-1
  sort_key[i] = i
end

ans = 0

m = 1 << n
m -= 1

def value_bit(s, e, m)
  m = m >> s
  sum = 0
  for i in s..e
    sum += 1 if (0x01 & m == 1)
    m = m >> 1
  end

  return sum
end

sort_key.sort_by{|i| block[i]}.each do |pos|
  m = m ^(0x01 << pos)
  tmp = value_bit(0, pos, m)
  tmp2 = value_bit(pos, n-1, m)
  if tmp > tmp2
    ans += tmp2
  else
    ans += tmp
  end
end

puts ans
