#!/usr/bin/ruby -Ku

a, b = gets.split(/\s/).map{|t| t.to_f}

puts (b /a).ceil
