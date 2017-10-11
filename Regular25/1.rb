#!/usr/bin/ruby

x = gets().split(/\s/)
y = gets().split(/\s/)
sum = 0

for i in 0..6 do
  if x[i].to_i > y[i].to_i
    sum += x[i].to_i
  else
    sum += y[i].to_i
  end
end

puts sum
