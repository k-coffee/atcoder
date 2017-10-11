#!/usr/bin/ruby -Ku

r, c, k = gets().split(/\s/).map{|t| t.to_i}

m = Array.new()
counter = 0

for i in 1..r
  m << gets().chomp.split(//)
end

checkmap = Marshal.load(Marshal.dump(m))

for x in 0..r-1
  for y in 0..c-1
    if m[x][y] == "o"
      next
    end

    for i in 0..(k-1)
      for j in 0..(k-1-i)
        checkmap[x-i][y+j] = "y" if (x-i) >= 0 && (y+j) <= (c-1)
        checkmap[x+i][y+j] = "y" if (x+i) <= (r-1) && (y+j) <= (c-1)
        checkmap[x-i][y-j] = "y" if (x-i) >= 0 && (y-j) >= 0
        checkmap[x+i][y-j] = "y" if (x+i) <= (r-1) && (y-j) <= (c-1)
      end
    end
  end
end

for x in (k-1)..r-k
  for y in (k-1)..c-k
    counter += 1 if checkmap][x][y] == "o"
  end
end

puts counter
