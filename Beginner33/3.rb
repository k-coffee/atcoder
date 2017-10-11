#!/usr/bin/ruby -Ku

counter = 0

x1 = gets.chomp

x2 = x1.split(/\+/)

x2.each do |tmp|
  flag = true
  tmp.split(/\*/).each do |c|
    flag = false if c == "0"
  end
  counter += 1 if flag
end

puts counter
