#!/usr/bin/ruby -Ku

$n = 0
$k = 0

def rec(up, mid, down, count)
  tmp = (($n - mid) / 2.0).ceil
  if tmp < up || tmp < down
    return 0
  end

  if count >= 3
    if mid > 0
      return 1
    else
      return 0
    end
  else
    c = 0
    c += rec(up+1, mid, down, count+1) * ($n - $k)
    c += rec(up, mid+1, down, count+1)
    c += rec(up, mid, down+1, count+1) * ($k - 1)
    return c
  end
end

$n, $k = gets().split(/\s/).map{|t| t.to_i}
ans = rec(0, 0, 0, 0) / 2
puts ans
puts ans / ($n**3).to_f
