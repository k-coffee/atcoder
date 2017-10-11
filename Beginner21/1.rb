#!/usr/bin/ruby -Ku

mask = 0x01
ans = Array.new()
tmp = 1
x = gets.to_i

while x > 0
  if x & mask == 1
    ans << tmp
  end
  x /= 2
  tmp *= 2
end

puts ans.size, ans
