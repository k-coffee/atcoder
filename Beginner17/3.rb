#!/usr/bin/ruby -Ku

ans = 0
n, m = gets().split(/\s/).map{|t| t.to_i}

j = Array.new(m, 0)

s = Array.new()

for i in 1..n
  tmp = gets().split(/\s/).map{|t| t.to_i}
  s << [tmp[2] / (tmp[1] - tmp[0] + 1), [tmp[0], tmp[1]], tmp[2]]
end

s.sort!{|a, b| b[0] <=> a[0]}

s.each do |t|
  bak = Marshal.load(Marshal.dump(j))
  for i in t[1][0]..t[1][1]
    bak[i-1] = 1
  end

  tmp = bak.uniq
  if tmp.size == 1 && tmp[0] == 1
  else
    ans += t[2]
    j = bak
  end
end

puts ans
