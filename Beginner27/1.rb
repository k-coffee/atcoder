#!/usr/bin/ruby -Ku

x = Hash.new(0)

t = gets().split(/\s/).map{|t| t.to_i}
t.each do |i|
  x[i] += 1
end

x.each do |k, v|
  if v % 2 != 0
    puts k
    break
  end
end
