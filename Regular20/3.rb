#!/usr/bin/ruby

n = gets().to_i
a = Array.new()

for i in 1..n do
  a << gets().split(/\s/)
end

b = gets().to_i

ans = ""
a.each do |tmp|
  bak = ""
  for i in 1..tmp[1].to_i
    ans += tmp[0]
    ans = (ans.to_i % b).to_s
    break if ans == bak
    bak = ans
  end
end
puts ans.to_i
