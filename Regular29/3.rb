#!/usr/bin/ruby -Ku

class unionfind
  def initialize(x)
    @m = Array.new(x, -1)
  end

  def find(x)
    while @m[x] >= 0
      x = @m[x]
    end
    return x
  end

  def union(x, y)
    s1 = find(x)
    s2 = find(y)
    
    if @m[s1] != @m[s2]
      if @m[s1] > @m[s2]
	@m[s1] += @m[s2]
        @m[s2] = s1
      else
	@m[s2] += @m[s1]
        @m[s1] = s2
      end
      return true
    end
    return false
  end
end

n, m = gets().split(/\s/).map{|x| x.to_i}

#cost = Array.new(n){Array.new(n, :MAX)}
cost = Array.new()
member = Array.new()

for i in 1..n
#  cost[0][i] = gets().to_i
  cost << gets().to_i
  member << [0, i]
end

for j in 1..m
  a, b, r = gets().split(/\s/).map{|x| x.to_i}
=begin
  cost[a][b] = r
  cost[b][a] = r
=end
  cost << r
  member << [a, b]
end

u = unionfind.new(n)
tmp = 1 << n
tmp -= 1

while tmp != 0
  x = cost.min
  pos = cost.index(x)

  if member[pos][0] == 0
  else
  end
end
