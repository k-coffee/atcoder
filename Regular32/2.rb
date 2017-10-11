#!/usr/bin/ruby -Ku

x, y = gets().split(/\s/).map{|t| t.to_i}
point = Array.new(x).map{|t| t = Array.new()}

for i in 1..y
  tmp = gets().split(/\s/).map{|t| t.to_i}
  b = tmp.max
  s = tmp.min
  point[s-1] << b-1
  point[b-1] << s-1
end

ans = 0

foo = Array.new(x, 1)

for i in 0..x-1
  next if foo[i] == 0
  s = point[i]
  ans += 1
  while s.size > 0 do
    hoge = s.shift
    if foo[hoge] != 0
      s << point[hoge] unless point[hoge].empty?
      point[hoge] = []
      s = s.flatten.uniq
    end
    foo[hoge] = 0
  end
end

puts ans-1
