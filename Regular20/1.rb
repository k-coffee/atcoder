#!/usr/bin/ruby

x = gets().split(/\s/)
ant = x[0].to_i.abs
bug = x[1].to_i.abs

if (ant - bug) > 0
  puts "Bug"
elsif (ant - bug) < 0
  puts "Ant"
else
  puts "Draw"
end
