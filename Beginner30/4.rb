#!/usr/bin/ruby -Ku

n, a = gets.split(/\s/).map{|t| t.to_i}
k = gets.to_i

b = gets.split(/\s/).map{|t| t.to_i}

counter = 1
flag = true
memory = Array.new(n, -1)

while counter < k
  if memory[a-1] >= 0 && flag
    tmp = (k - counter) / (counter - memory[a-1])
    counter += tmp * (counter - memory[a-1])
    flag = false
  else
    memory[a-1] = counter
  end
  a = b[a-1]
  counter += 1
end

puts b[a-1]
