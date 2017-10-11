#!/usr/bin/ruby -Ku

n, m = gets.split(/\s/).map{|t| t.to_i}
x, y = gets.split(/\s/).map{|t| t.to_i}

a2b = gets.split(/\s/).map{|t| t.to_i}
b2a = gets.split(/\s/).map{|t| t.to_i}

time = 0
counter = 0

while a2b.empty? == false && b2a.empty? == false
#puts "in0"
  if time <= a2b[0]
#puts "in1"
    time = a2b[0] + x
    a2b.shift
    while b2a.empty? != true
#puts "in2"
      if time <= b2a[0]
#puts "in3"
        time = b2a[0] + y
        b2a.shift
        counter += 1
        break
      end
      b2a.shift
    end
  else
    a2b.shift
  end
end

puts counter
