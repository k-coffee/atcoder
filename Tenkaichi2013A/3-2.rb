#!/usr/bin/ruby -Ku

$counter = 0

def rec(a, m, n, i, j, num)
  flag = false
  for x in 1..num
    next if i-x < 0
p a, i, j, num
    if a[i-x][j] == num
puts "in1"
      flag = true
      break
    end
  end
  unless flag
    for x in 1..num
      next if j-x < 0
      if a[i][j-x] == num
puts "in2"
        flag = true
        break
      end
    end
  end

  unless flag
    if m-1 == i && n-1 == j
      $counter += 1
    else
      for x in 1..3 do
        if j + 1 < n
	  tmpa = Marshal.load(Marshal.dump(a))
	  tmpa[i][j] = x
          rec(tmpa, m, n, i, j+1, x)
        else
	  tmpa = Marshal.load(Marshal.dump(a))
	  tmpa[i][j] = x
  	  rec(tmpa, m, n, i+1, 0, x) if i+1 < m
        end
      end
    end
  end
end

x = gets().chomp.split(/\s/)
m = x[0].to_i
n = x[1].to_i

a = Array.new(m).map!{Array.new(n)}

for i in 1..3 do 
  a[0][0] = i
  rec(a, m, n, 0, 1, i)
end

puts $counter
