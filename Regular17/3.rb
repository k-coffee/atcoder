#!/usr/bin/ruby -Ku

$counter = 0
$first_list = Hash.new(0)
$last_list = Hash.new(0)

def saiki(w, i, n, now, maxsize, flag)
  if now + w[i] < maxsize
    if flag
      $last_list[now+w[i]] += 1
    else
      $first_list[now+w[i]] += 1
    end
    if flag == false
      for j in i+1..((n-1)/2)-1
        saiki(w, j, n, now+w[i], maxsize, flag)
      end
    else
      for j in i+1..n-1
        saiki(w, j, n, now+w[i], maxsize, flag)
      end
    end
  elsif now + w[i] == maxsize
    $counter += 1
  end
end

tmp = gets().chomp.split(/\s/)
n = tmp[0].to_i
x = tmp[1].to_i
w = Array.new(n)
last_num = (n-1) / 2

for i in 0..n-1
  tmp = gets().chomp.to_i
  w[i] = tmp
end

for i in last_num..n-1
  saiki(w, i, n, 0, x, true)
end

for i in 0..last_num-1
  saiki(w, i, n, 0, x, false)
end

$first_list.each do |key, value|
  $counter += value * $last_list[x-key]
end

puts $counter
