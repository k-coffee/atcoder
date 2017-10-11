#!/usr/bin/ruby -Ku

n = gets.to_i
an = gets.split(/\s/).map{|t| t.to_i}

takahashi = -10000000

for i in 0..an.size-1
  tmp_t = 0
  aoki = -1000000
  for j in 0..an.size-1
    tmp = 0
    tmp2 = 0
    if i == j
      next
    end
    s = i
    e = j
    if s > e
      e = i
      s = j
    end

    an[s..e].each_with_index do |x, t|
      if t % 2 == 1
        tmp += x
      else
        tmp2 += x
      end
    end
    if aoki < tmp
      aoki = tmp
      tmp_t = tmp2
    end
  end
  if takahashi < tmp_t
    takahashi = tmp_t
  end
end

puts takahashi
