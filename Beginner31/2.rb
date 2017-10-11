#!/usr/bin/ruby -Ku

l, h = gets.split(/\s/).map{|t| t.to_i}
n = gets.to_i
ans = Array.new()

n.times do |t|
  tmp = gets.to_i

  if tmp > h
    ans << -1
  elsif tmp < l
    ans << (l - tmp)
  else
    ans << 0
  end
end

puts ans
