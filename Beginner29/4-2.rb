#!/usr/bin/ruby -Ku

n = gets.to_i
ans = 0
shuuki = 10
keta = 1

while n / keta >= 1
  x = n / shuuki
  ans += (x * keta)
  y = n % shuuki
  z = shuuki / 10
  if z * 2 <= y
    ans += z
  elsif z > y
    ans += 0
  else
    ans += (y - z) + 1
  end
  shuuki *= 10
  keta *= 10
end

puts ans
