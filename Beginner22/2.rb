#!/usr/bin/ruby -Ku

n = gets.to_i
counter = 0
checker = 0

for i in 1..n
  tmp = gets.to_i
  if checker & (1 << (tmp-1)) != 0
    counter += 1
  end
  checker |= (1 << (tmp-1))
end

puts counter
