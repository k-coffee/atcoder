#!/usr/bin/ruby -Ku

a, b = gets().split(/\s/).map{|x| x.to_i}.sort
n = gets().to_i
tmp = Array.new()

n.times do
  tmp << gets().split(/\s/).map{|x| x.to_i}.sort
end

tmp.each do |c, d|
  if a <= c && b <= d
    puts "YES"
  else
    if a > c
      puts "NO"
    else
      x1 = (4*d + Math.sqrt(16*d*d -16 * (c*c + d*d -a*a -b*b))) / 8
      x2 = (4*d - Math.sqrt(16*d*d -16 * (c*c + d*d -a*a -b*b))) / 8
      if x1 - d < 0 || (x2 - d < 0 && x2 > 0)
        puts "YES"
      else
        puts "NO"
      end
    end
  end
end

