#!/usr/bin/ruby -Ku

#n, m = gets().split(/\s/)
n, m = gets.split.map{|t| t.to_i}
dp=[0]*n+[1]

p dp
p n, m

p [1], [0], [-1]
