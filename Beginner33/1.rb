#!/usr/bin/ruby -Ku

x = gets.chomp.split(//)

if x.uniq.size == 1
  puts "SAME"
else
  puts "DIFFERENT"
end
