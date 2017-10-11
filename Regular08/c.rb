#!/usr/bin/ruby -Ku

class Person
  attr_accessor :x, :y, :max, :min, :cost, :check
  def initialize(x = 0, y = 0, max = 0, min = 0, cost = 999999, check = 0)
    @x = x
    @y = y
    @max = max
    @min = min
    @cost = cost
    @check = check
  end
end

def dist(a, b, x, y)
  return Math::sqrt((a - x)**2 + (b - y)**2)
end

def time(dist, x_speed, y_speed)
  min = (x_speed < y_speed) ? x_speed : y_speed

  return dist.to_f / min.to_f
end

num = gets().chomp.to_i
a = Array.new(num)

for i in 1..num
  p = Person.new()
  line = gets().chomp
  tmp = line.split(/\s/)
  p.x = tmp[0].to_f
  p.y = tmp[1].to_f
  p.max = tmp[2].to_f
  p.min = tmp[3].to_f
  a[i-1] = p
end

dist0x = a[0].x
dist0y = a[0].y

for i in 1..num-1
  tmpx = a[i].x
  tmpy = a[i].y
  ys = a[i].min
  d = dist(dist0x, dist0y, tmpx, tmpy)
  a[i].cost = time(d, a[0].max, ys)
end

a[0].check = 1

i = 1
while i != num
  tmpmin = 9999999
  c = 0
  for j in 1..num-1
    if tmpmin > a[j].cost && a[j].check == 0
      c = j
      tmpmin = a[j].cost
    end
  end
  a[c].check = 1
  for j in 1..num-1
    if a[j].check == 0
      d = dist(a[c].x, a[c].y, a[j].x, a[j].y)
      tmpcost = time(d, a[c].max, a[j].min) + a[c].cost
      a[j].cost = tmpcost if tmpcost < a[j].cost
    end
  end
  i += 1
end

ans = 0
a.sort_by{|x| x.cost}.each_with_index do |tmpp, n|
  if n != num - 1
    ans = ans > (tmpp.cost + num - n - 1) ? ans : (tmpp.cost + num - n - 1)
  end
end

ans = ans -1 if ans != 0
puts ans

=begin
maxcost = num - 1
mincost = 99999
for i in 1..num-1
  maxcost = a[i].cost if maxcost < a[i].cost
  mincost = a[i].cost if mincost > a[i].cost
end

maxcost -= 1
maxcost += mincost - 1 if mincost > 1
if maxcost != num-1
  maxcost += 1
end

if mincost == 99999
  puts 0
else
  puts maxcost
end
=end
