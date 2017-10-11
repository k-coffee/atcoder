#!/usr/bin/ruby -Ku

n, k = gets().split(/\s/).map{|t| t.to_f}
youki = Array.new(n)
min = 0
max = 100
mid = (min + max) / 2.0

for i in 0..n-1
  tmp = gets().split(/\s/).map{|t| t.to_i}
  youki[i] = [tmp[0], tmp[1], 0]
end

for i in 1..100
  mid = (min + max) / 2.0
  for j in 0..n-1
    youki[j][2] = youki[j][0] * (youki[j][1] - mid) / 100
  end
  youki.sort!{|a, b| b[2] <=> a[2]}

  sumw = 0
  sum = 0

  for i in 0..k-1
    sumw += youki[i][0]
    sum += youki[i][0] * youki[i][1].to_f / 100
  end
  if (sum / sumw * 100) >= mid
    min = mid
  else
    max = mid
  end

  break if max == min
end

puts min
