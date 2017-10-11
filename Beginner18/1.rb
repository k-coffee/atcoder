#!/usr/bin/ruby -Ku

x = Array.new()

x << [gets().to_i, 1]
x << [gets().to_i, 2]
x << [gets().to_i, 3]

x.sort!{|a,b| b[0] <=> a[0]}
for i in 1..3
  c = 1
  for j in 0..2
    if x[j][1] == i
      puts c
      break
    else
      c += 1
    end
  end
end
