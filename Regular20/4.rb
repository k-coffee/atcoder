#!/usr/bin/ruby

tmp = gets().split(/\s/)
town = Array.new()
load = Array.new()

for i in 1..tmp[0].to_i-1
  load << gets().to_i
end

for i in 1..tmp[0].to_i
  town << i
end

m = tmp[1].to_i
k = tmp[2].to_i

counter = 0
town.permutation(k).each do |x|
  tmpload = 0
  for i in 0..x.size-2
    s = x[i]-1
    e = x[i+1]-1
    if s > e
      tmp = s
      s = e
      e = tmp
    end

    if s != e
      tmpload += load[s..e-1].inject(:+)
    else
      tmpload += load[s]
    end
  end
  if tmpload % m == 0
    counter += 1
  end
end

puts counter % 1000000007
