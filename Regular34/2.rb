#!/usr/bin/ruby -Ku

n = gets()

keta = n.split(//).size
N = n.to_i
counter = 0
ans = Array.new()

for i in (N-keta*9)..N
  tmp = i.to_s.split(//).map{|x| x.to_i}.inject(:+)
  if N == (tmp + i)
    ans << i
    counter += 1
  end
end

puts counter, ans
