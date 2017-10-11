#!/usr/bin/ruby -Ku

n = gets.to_i
i = 1
counter = [0]
ans = 0
j = 0

while n / i >= 1
  counter << (i + counter[-1] * 10)
  i *= 10
  j += 1
end

i /= 10

while i >= 1
  tmp = n / i
  if tmp > 0
    if tmp == 1
      x = n % i
      puts i
#      ans += counter[j-1]
=begin
      ans += (counter[j-1] * (x + 1))
      ans += counter[j-1]
=end
      ans += x + 1
      puts ans
    else
#      ans += (counter[j] - (counter[j-1] * 10))
      ans += tmp * counter[j-1]
    end
  end
  n %= i
  j -= 1
  i /= 10
end

if ans == 0
  puts 1
else
  puts ans
end
