#!/usr/bin/ruby -Ku

def is_prime(x)
  max = Math.sqrt(x)
  return 0 if x == 1
  if x % 2 == 0
    return 0
  end
  i = 3
  while i <= max do
    if x % i == 0
      return 0
    end
    i += 2
  end
end

a = gets().to_i

sum = 0

for i in 1..a
  sum += i
end

if is_prime(sum) == 0
  puts "BOWWOW"
else
  puts "WANWAN"
end

