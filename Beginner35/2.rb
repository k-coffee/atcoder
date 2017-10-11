#!/usr/bin/ruby -Ku

n = gets.to_i
x = Array.new(n).map{|t| t = Array.new(n)}

n.times do |i|
  tmp = gets.chomp.split(//)
  tmp.each_with_index do |y, t|
    x[t][n-i] = y
  end
end

x.each do |t|
  puts t.join
end
