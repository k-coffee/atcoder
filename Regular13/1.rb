#!/usr/bin/ruby -Ku

a = gets().chomp
main = a.split(/\s/).map{|x| x = x.to_i}
a = gets().chomp
sub = a.split(/\s/).map{|x| x = x.to_i}
p main, sub

max = 1000
min = 1000
minnum = Array.new()

for i in 0..2
  min = 1000
  tmp = 0
  for j in 0..2
    if min > (main[i] / sub[j])
      min = main[i] / sub[j]
      tmp = j
    end
  end
  if max > min
    max = min
    minnum = [i, tmp]
  end
end
p minnum

h = (main[minnum[0]] / sub[minnum[1]]).to_i

x = Array.new()
y = Array.new()
for i in 0..2
  x << main[i] if minnum[0] != i
end
for i in 0..2
  y << sub[i] if minnum[1] != i
end

k = [(x[0] / y[0]) * (x[1] / y[1]), (x[0] / y[1]) * (x[1] / y[0])].max
puts k.to_i * h
