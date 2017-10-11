#!/usr/bin/ruby -Ku

def calc(a, b, p)
  if b == 0
    return 1
  else
    if b % 2 == 0
      d = calc(a, b/2, p)
      return (d * d) % p
    else
      return (a * calc(a, b-1, p) % p)
    end
  end
end

w, h = gets().split(/\s/).map{|t| t.to_i - 1}
ans = w + h

if w < h
  min = w
else
  min = h
end


for i in (w+h+1-min)..(w+h-1)
  ans *= i
  ans %= 1000000007
end

tmp = 1
for i in 2..min
  tmp *= i
  tmp %= 1000000007
end

ans *= calc(tmp, 1000000005, 1000000007)

puts ans % 1000000007
