#!/usr/bin/ruby -Ku

x = gets().split(/\s/).map{|t| t.to_i}

puts x.sort[1]
