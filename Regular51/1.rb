#!/usr/bin/ruby -Ku

tmp = gets.chomp.split(/\s/).map{|t| t.to_i}
circle = [[tmp[0]-tmp[2], tmp[1]-tmp[2]], [tmp[0]+tmp[2], tmp[1]+tmp[2]]]
r = tmp[2] * Math.sin(Math::PI / 4)
circles = [tmp[0], tmp[1], tmp[2]]
tmp = gets.chomp.split(/\s/).map{|t| t.to_i}
square = [[tmp[0], tmp[1]], [tmp[2], tmp[3]]]
x = Array.new()
y = Array.new()

x = [(circles[0] - square[0][0])**2, (square[1][0] - circles[0])**2, (square[0][0] - circles[0])**2, (circles[0] - square[1][0])**2].max
y = [(circles[1] - square[0][1])**2, (square[1][1] - circles[1])**2, (square[0][1] - circles[1])**2, (circles[1] - square[1][1])**2].max
if (Math.sqrt(x+y) <= circles[2])
  puts "YES"
  puts "NO"
elsif (circle[0][0] >= square[0][0]) && (circle[1][0] <= square[1][0]) && (circle[0][1] >= square[0][1]) && (circle[1][1] <= square[1][1])
  puts "NO"
  puts "YES"
else
  puts "YES"
  puts "YES"
end
