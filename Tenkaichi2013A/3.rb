#!/usr/bin/ruby -Ku

$c = 0

def check(a, m, n)
  for i in 0..m-1
    for j in 0..n-1
      if a[i][j] == 1
	tmp = 0
	for k in 1..m
	  if i+k >= m
	    break
	  end
	  if a[i+k][j] == 1
	    tmp = k
	    break
	  end
	end
	if tmp <= 1 && tmp != 0
	  return -1
	end
	tmp = 0
	for k in 1..n
	  if j+k >= n
	    break
	  end
	  if a[i][j+k] == 1
	    tmp = k
	    break
	  end
	end
	if tmp <= 1 && tmp != 0
	  return -1
	end
      end

      if a[i][j] == 2
	tmp = 0
	for k in 1..m
	  if i+k >= m
	    break
	  end
	  if a[i+k][j] == 2
	    tmp = k
	    break
	  end
	end
	if tmp <= 2 && tmp != 0
	  return -1
	end
	tmp = 0
	for k in 1..n
	  if j+k >= n
	    break
	  end
	  if a[i][j+k] == 2
	    tmp = k
	    break
	  end
	end
	if tmp <= 2 && tmp != 0
	  return -1
	end
      end

      if a[i][j] == 3
	tmp = 0
	for k in 1..m
	  if i+k >= m
	    break
	  end
	  if a[i+k][j] == 3
	    tmp = k
	    break
	  end
	end
	if tmp <= 3 && tmp != 0
	  return -1
	end
	tmp = 0
	for k in 1..n
	  if j+k >= n
	    break
	  end
	  if a[i][j+k] == 3
	    tmp = k
	    break
	  end
	end
	if tmp <= 3 && tmp != 0
	  return -1
	end
      end
    end
  end
  return 0
end

def set(a, m, n, i, j)
  if m == i
    if check(a, m, n) != -1
      $c += 1
    end
  else
    for tmp in 1..3
      tmpa = Marshal.load(Marshal.dump(a))
      tmpa[i][j] = tmp
      if j+1 == n
        set(tmpa, m, n, i+1, 0)
      else
        set(tmpa, m, n, i, j+1)
      end
    end
  end
end

x = gets().chomp.split(/\s/)
m = x[0].to_i
n = x[1].to_i

a = Array.new(m).map!{Array.new(n)}

set(a, m, n, 0, 0)

puts $c
