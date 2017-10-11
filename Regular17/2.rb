#!/usr/bin/ruby -Ku

x = gets().chomp.split(/\s/)
n = x[0].to_i
k = x[1].to_i
num_counter = 0
ans_counter = 0
tmp = 0

for i in 1..n
  x = gets().chomp.to_i
  if tmp < x
    num_counter += 1
  else
    num_counter = 1
  end
  if num_counter >= k
    ans_counter += 1
  end
  tmp = x
end

puts ans_counter
