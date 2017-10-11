#!/usr/bin/ruby -Ku

$n = 0

def rec(now, count, rem)
  if count == 2
    return 1 if (rem - now) <= $n
  else
    tmp = 0
    for i in 1..$n
      tmp += rec(i, count+1, rem-i)
    end
    return tmp
  end
end

$n, k = gets().split(/\s/).map{|t| t.to_i}
ans = 0

for i in 1..$n
  ans += rec(i, 1, k*3-i)
end

puts ans
