#!/usr/bin/ruby -Ku

k, n = gets.split(/\s/).map{|t| t.to_i}

moji = Array.new()
moji2 = Array.new()

n.times do |t|
  x = gets.split(/\s/)
  moji << [x[0].split(//), x[1].split(//)]
  moji2 << [x[0].split(//), x[1].size]
end

def rec(c, now, s)
  if c > n
  else
    for i in 1..3
      
    end
  end
end
