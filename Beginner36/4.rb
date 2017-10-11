#!/usr/bin/ruby -Ku

def f(pos, bak)
  tmp = 1
  $x[pos].each do |t|
    tmp *= g(t, pos) if t != bak
  end

#  return (g(pos, bak) + tmp) % (10**9 + 7)
  return g(pos, bak) + tmp
end

def g(pos, bak)
  tmp = 1
  $x[pos].each do |t|
    tmp *= f(t, pos) if t != bak
  end

#  return tmp % (10**9 + 7)
  return tmp
end

n = gets.to_i
$x = Array.new(n).map{|t| t = Array.new()}

for i in 1..n-1
  a, b = gets.split(/\s/).map{|t| t.to_i}
  $x[a-1] << b-1
  $x[b-1] << a-1
end

puts f(0, -1) % (10**9 + 7)
