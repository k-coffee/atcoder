#!/usr/bin/ruby -Ku

ans = 0
n = gets().to_i

x = gets().split(/\s/).map{|t| t.to_i}
all = x.inject(:+)

ave = all / n.to_f

if all % n != 0
  puts -1
  exit(0)
else
  tmp = 0
  c = 0
  x.each do |t|
    c += 1
    tmp += t
    if tmp / c.to_f == ave
      c = 0
      tmp = 0
    else
      ans += 1
    end
  end
end

puts ans
