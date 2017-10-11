#!/usr/bin/ruby -Ku

$n = gets().to_i
tmp = $n
$t = 0
$a = 0

dep = 0

while tmp > 0
  dep += 1
  tmp /= 2
end

if dep % 2 == 0
  $t = 0
  $a = 1
else
  $t = 1
  $a = 0
end

def rec(x, turn)
  if turn > 0
    tmp = $t
  else
    tmp = $a
  end
  if (2 * x + tmp) > $n
    return turn * (-1)
  else
    return rec(2 * x + tmp, turn * (-1))
  end
end

x = rec(1, 1)

if x == 1
  puts "Takahashi"
else
  puts "Aoki"
end
