#!/usr/bin/ruby -Ku

r, c, k = gets().split(/\s/).map{|t| t.to_i}

m = Array.new()
up_dist = Array.new()
down_dist = Array.new()
counter = 0


for i in 1..r
  m << gets().chomp.split(//)
  up_dist << Array.new(c, 0)
  down_dist << Array.new(c, 0)
end

for x in 0..r-1
  for y in 0..c-1
    tmp = 0
    xx = x
    while xx >= 0 && m[xx][y] == "o"
      tmp += 1
      xx -= 1
    end
    up_dist[x][y] = tmp
    tmp = 0
    xx = x
    while xx <= r-1 && m[xx][y] == "o"
      tmp += 1
      xx += 1
    end
    down_dist[x][y] = tmp
  end
end

for x in (k-1)..(r-k)
  for y in (k-1)..(c-k)
    flag = true
    for tmpk in 0..k-1
      if up_dist[x][y-tmpk] < (k-tmpk) || up_dist[x][y+tmpk] < (k-tmpk) || down_dist[x][y-tmpk] < (k-tmpk) || down_dist[x][y+tmpk] < (k-tmpk)
        flag = false
      end
    end
    counter += 1 if flag
  end
end

puts counter
