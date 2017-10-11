#!/usr/bin/ruby -Ku

x = gets().chomp
n = x.to_i
num = 0
for i in 0..n-1
  tf = gets().chomp.split(/\s/).map{|x| x = x.to_i}
  m = gets().chomp.to_i
  haba = Array.new()

  xp = xn = tf[0]
  yp = yn = tf[1]
  zp = zn = tf[2]

  for j in 0..m-1
    haba << gets().chomp.split(/\s/).map{|x| x = x.to_i}
  end

  for j in 0..m-1
    xn = haba[j][0] if xn > haba[j][0]
    yn = haba[j][1] if yn > haba[j][1]
    zn = haba[j][2] if zn > haba[j][2]

    xp = tf[0]-haba[j][0]-1 if xp > tf[0]-haba[j][0]-1
    yp = tf[1]-haba[j][1]-1 if yp > tf[1]-haba[j][1]-1
    zp = tf[2]-haba[j][2]-1 if zp > tf[2]-haba[j][2]-1
  end
  num = num^xp^xn^yp^yn^zp^zn
end

if num == 0
  puts "LOSE"
else
  puts "WIN"
end
