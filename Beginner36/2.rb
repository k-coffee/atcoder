#!/usr/bin/ruby -Ku

n = gets.to_i
a = Array.new(n)

for i in 1..n
  t = gets.chomp.split(//)
  a[n-i] = t
end

for i in 0..n-1
  for j in 0..n-1
    print a[j][i]
  end
  puts
end
