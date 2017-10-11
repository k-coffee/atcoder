#!/usr/bin/ruby -Ku

n = gets.to_i
checker = Array.new(n, 0)
counter = 0

for i in 1..n
  tmp = gets.to_i - 1
  if checker[tmp] == 1
    counter += 1
  end
  checker[tmp] = 1
end

puts counter
