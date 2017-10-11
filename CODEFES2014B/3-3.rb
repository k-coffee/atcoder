#!/usr/bin/ruby -Ku

a = Hash.new(0)
b = Hash.new(0)
x = Hash.new(0)
gets.chomp.split(//).map{|t| a[t] += 1}
gets.chomp.split(//).map{|t| b[t] += 1}
gets.chomp.split(//).map{|t| x[t] += 1}

n = a.size

musta = 0
mustb = 0
flag = true

a.merge(b).merge(x).each do |k, v|
  hoge = [0, x[k] - b[k]].max
  foo = ((x[k] - b[k]) <= a[k])
  flag &= foo
  musta += hoge
  hoge = [0, x[k] - a[k]].max
  foo = ((x[k] - a[k]) <= b[k])
  flag &= foo
  mustb += hoge
end

flag &= ((musta <= n.to_f / 2) && (mustb <= n.to_f / 2))
if flag
  puts "YES"
else
  puts "NO"
end
