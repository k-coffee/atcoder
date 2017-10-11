#!/usr/bin/ruby -Ku

n = gets().to_i
r = Array.new()
ans = 0

for i in 1..n
  r << gets().to_i
end

r.sort!

r.reverse.each_with_index do |x, i|
  if i % 2 == 0
    ans += x**2
  else
    ans -= x**2
  end
end

puts ans * Math::PI
