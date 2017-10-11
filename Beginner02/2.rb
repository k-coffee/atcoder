#!/usr/bin/ruby -Ku

x = gets().chomp

puts x.gsub(/[aoeui]/, "")
