#!/usr/bin/ruby -Ku

x = gets().chomp
c = x.split(/\s/).map{|t| t = t.to_i}
max = 0
mid = 0
min = 0

for i in 0..c[0]-1
  x = gets().chomp
  tmp = x.split(/\s/).map{|t| t = t.to_i}
  tmpmax = tmp.max
  tmpmin = tmp.min
  tmp.delete_at(tmp.index(tmpmax))
  tmp.delete_at(tmp.index(tmpmin))
  tmpmid = tmp[0]

  max = tmpmax if max < tmpmax
  min = tmpmin if min < tmpmin
  mid = tmpmid if mid < tmpmid
end

puts max * mid * min
