#!/usr/bin/ruby -Ku

$n = gets().to_i
$memo = Hash.new(0)

x = 1

# return the winner (1 = takahashi, -1 = aoki)
def rec(x, turn)
  if $memo[x*turn] != 0
    return $memo[x*turn]
  end

  if 2 * x > $n
    $memo[x*turn] = turn * (-1)
    return turn * (-1)
  end

  right = rec(2*x, turn * (-1))
  left = rec(2*x+1, turn * (-1))

  if right == turn || left == turn
    $memo[x*turn] = turn
    return turn
  else
    $memo[x*turn] = turn * (-1)
    return turn * (-1)
  end
end

ans = rec(x, 1)

if ans == 1
  puts "Takahashi"
else
  puts "Aoki"
end
