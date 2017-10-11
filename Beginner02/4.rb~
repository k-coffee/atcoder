#!/usr/bin/ruby -Ku

x = gets().chomp.split(/\s/)
x[0] = x[0].to_i
x[1] = x[1].to_i

max = 1
person = Array.new(x[0])

for i in 0..person.size-1
  person[i] = [i]
end

for i in 1..x[1]
  y = gets().chomp.split(/\s/)
  person[y[0].to_i-1] << (y[1].to_i-1)
  person[y[1].to_i-1] << (y[0].to_i-1)
end

for i in 0..person.size-1
  person[i] = person[i].uniq.sort
end

for i in 0..person.size-1
  for j in i+1..person.size-1
    if (person[i] & person[j]) == person[i]
      max = person[i].size if max < person[i].size
    end
  end
end

puts max
