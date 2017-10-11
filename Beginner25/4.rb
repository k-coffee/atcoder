#!/usr/bin/ruby -Ku

$pre = Hash.new(-1)
$memo = Hash.new(-1)

def check_map(i, map)
  if i == 0 || i == 4 || i == 20 || i == 24
    return true
  else
    c1 = (map & (1 << (i+5))) != 0 ? true : false
    c2 = (map & (1 << (i-5))) != 0 ? true : false
    c3 = (map & (1 << (i+1))) != 0 ? true : false
    c4 = (map & (1 << (i-1))) != 0 ? true : false
    if i > 4 && i < 20 && c1 != c2
      return false
    end
    if i % 5 > 0 && i % 5 < 4 && c3 != c4
      return false
    end
  end
  return true
end

def rec(i, map, intmap)
  if i > 25
    return 1
  end

  if $memo[intmap] != -1
    return $memo[intmap]
  end

  counter = 0
  if $pre.has_key?(i)
    x = $pre[i]
    if check_map(x, intmap)
      tmpmap = Marshal.load(Marshal.dump(map))
      tmpmap[x/5][x%5] = i
      tmp = rec(i+1, tmpmap, (intmap | (1 << x)))
      $memo[intmap] = tmp % 1000000007
      return tmp % 1000000007
    else
      return 0
    end
  else
    for n in 0..4
      for m in 0..4
        if map[n][m] == 0
          if check_map(n*5+m, intmap)
            tmpmap = Marshal.load(Marshal.dump(map))
            tmpmap[n][m] = i
            
            counter += rec(i+1, tmpmap, (intmap | (1 <<(n*5+m))))
          end
        end
      end
    end
  end
  $memo[intmap] = counter % 1000000007
  return counter % 1000000007
end

tmppre = Array.new()
first_map = Array.new(5).map{|t| t = Array.new(5)}
for i in 0..4
  tmppre << gets().split(/\s/).map{|t| t.to_i}
end
tmppre.flatten.each_with_index do |x, i|
  if x != 0
    $pre[x] = i
    first_map[i/5][i%5] = -1
  else
    first_map[i/5][i%5] = 0
  end
end

puts rec(1, first_map, 0)
