#!/usr/bin/ruby -Ku

r, c, k = gets().split(/\s/).map{|t| t.to_i}

m = Array.new()
counter = 0

for i in 1..r
  m << gets().chomp.split(//)
end

for x in (k-1)..(r-k)
  for y in (k-1)..(c-k)
    flag = true
    for i in 0..(k-1)
      for j in 0..(k-1-i)
        if m[x-i][y+j] == "x" || m[x+i][y+j] == "x" || m[x-i][y-j] == "x" || m[x+i][y-j] == "x"
          flag = false
          break
        end
      end
    end
    if flag
      counter += 1
    end
  end
end

puts counter
