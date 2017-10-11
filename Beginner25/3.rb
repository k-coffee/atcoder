#!/usr/bin/ruby -Ku

$b1 = gets().split(/\s/).map{|t| t.to_i}
$b2 = gets().split(/\s/).map{|t| t.to_i}
$c1 = gets().split(/\s/).map{|t| t.to_i}
$c2 = gets().split(/\s/).map{|t| t.to_i}
$c3 = gets().split(/\s/).map{|t| t.to_i}

$memo = Hash.new(-1)

def get_score(map)
  score = 0
  for j in 0..2
    if map[0][j] == map[1][j]
      score += $b1[j]
    end
    if map[1][j] == map[2][j]
      score += $b2[j]
    end
  end

  for i in 0..2
    tmp = Array.new()
    case i
    when 0
      tmp = $c1
    when 1
      tmp = $c2
    when 2
      tmp = $c3
    else
    end

    if map[i][0] == map[i][1]
      score += tmp[0]
    end
    if map[i][1] == map[i][2]
      score += tmp[1]
    end
  end

  return score
end

def rec(turn, map)
  score = turn % 2 == 0 ? 10000 : 0
  return $memo[map] if $memo[map] != -1
  if turn > 9
    x = get_score(map)
    $memo[map] = x
    return x
  end
  for i in 0..2
    for j in 0..2
      next if map[i][j] != 0
      tmp_map = Marshal.load(Marshal.dump(map))
      if turn % 2 == 0
        tmp_map[i][j] = 2
      else
        tmp_map[i][j] = 1
      end
      tmp_score = rec(turn + 1, tmp_map)
      if turn % 2 == 0
        if tmp_score < score
          score = tmp_score
        end
      else
        if tmp_score > score
          score = tmp_score
        end
      end
    end
  end
  $memo[map] = score
  return score
end

mymap = Array.new(3).map{|x| x = Array.new(3, 0)}
total = $b1.inject(:+)
total += $b2.inject(:+)
total += $c1.inject(:+)
total += $c2.inject(:+)
total += $c3.inject(:+)

x = rec(1, mymap)
puts x
puts (total - x)
