#!/usr/bin/ruby -Ku

x = gets().chomp
x = x.gsub(/\.$/, '').split(/\s/)

n = x[0].to_i
m = x[1].to_i
a = x[2].to_i
b = x[3].to_i
result = []

for i in 0..(m-1)
  n += b if n <= a
  y = gets().chomp.to_i
  n -= y

  if n < 0
    result << i+1
  end
end

if result.empty?
  puts "complete"
else
  puts result[0]
end
