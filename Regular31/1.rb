#!/usr/bin/ruby -Ku

x = gets().chomp.split(//)

for i in 0..x.size/2
  if x[i] != x[x.size-i-1]
    puts "NO"
    exit(0)
  end
end

puts "YES"
