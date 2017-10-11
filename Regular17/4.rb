#!/usr/bin/ruby -Ku

def eucledean(m, n)
  if m < n
    tmp = m
    m = n
    n = tmp
  end
  if n == 0
    return m
  else
    eucledean(n, m % n)
  end
end

#puts eucledean(1029, 1071)

tmp = gets().chomp
n = tmp.to_i
baker = gets().chomp.split(/\s/).map{|t| t = t.to_i}
i = gets().chomp.to_i

for j in 0..i-1
  tmp = gets().chomp.split(/\s/).map{|t| t = t.to_i}
  if tmp[0] == 0
    ans = baker[tmp[1]-1]
    for k in tmp[1]..tmp[2]-1
      ans = eucledean(baker[k], ans)
    end
    puts ans
  elsif tmp[0] > 0
    for k in tmp[1]-1..tmp[2]-1
      baker[k] += tmp[0]
    end
  else
    for k in tmp[1]-1..tmp[2]-1
      baker[k] += tmp[0]
    end
  end
end
