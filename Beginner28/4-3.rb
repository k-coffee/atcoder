#!/usr/bin/ruby -Ku

n, k = gets.split(/\s/).map{|t| t.to_i}

all = n**3

one = ((k - 1) * (n - k)) * 6
two = (n - 1) * 3
three = 1

puts (one + two + three) / all.to_f
