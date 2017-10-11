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
    max = Math::PI / 2
    min = 0
    flag = false
    for i in 0..100
      mid = (max + min) / 2
      if (c > a*Math.cos(mid) + b*Math.sin(mid))
        if (d > a*Math.sin(mid) + b*Math.cos(mid))
          flag = true
          break
        else
          min = mid
        end
      else
        max = mid
      end
    end
    if flag
      puts "YES"
    else
      puts "NO"
    end
  end
end

