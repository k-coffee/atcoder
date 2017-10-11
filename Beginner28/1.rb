#!/usr/bin/ruby -Ku

x = gets.to_i

if x < 60
  puts "Bad"
elsif x < 90
  puts "Good"
elsif x < 100
  puts "Great"
else
  puts "Perfect"
end
