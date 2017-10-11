#!/usr/bin/ruby

x = gets().to_i

tmp = Math::sqrt(x)

if x == 2
  puts "YES"
  exit(0)
end

if x % 2 == 0
  puts "NO"
  exit(0)
end

i = 3
while i <= tmp
  if x % i == 0
    puts "NO"
    exit(0)
  end
  i += 2
end

puts "YES"
