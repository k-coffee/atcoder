#!/usr/bin/ruby -Ku

x = gets().to_i

y = (x / 2).ceil
x = (x / 2).floor

puts x * y
