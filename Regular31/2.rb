#!/usr/bin/ruby -Ku

$tmp = Array.new(Array.new())

def search_map(i, j)
  if i < 0 || i > 9 || j < 0 || j > 9
  else
    if $tmp[i][j] == "o"
      $tmp[i][j] = "c"
      search_map(i+1, j)
      search_map(i, j+1)
      search_map(i-1, j)
      search_map(i, j-1)
    end
  end
end

def check_map(map)
  flag = true
  for i in 0..9
    for j in 0..9
      flag = false if map[i][j] == "o"
    end
  end
  return flag
end

map = Array.new()

for i in 1..10
  map << gets().chomp.split(//)
end

for i in 0..9
  for j in 0..9
    $tmp = Marshal.load(Marshal.dump(map))
    if $tmp[i][j] == "x"
      $tmp[i][j] = "o"
      search_map(i, j)

      if check_map($tmp)
        puts "YES"
        exit(0)
      end
    end
  end
end

puts "NO"
