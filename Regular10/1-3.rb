#!/usr/bin/ruby -Ku

x = gets().chomp
x = x.split(/\s/)

n = x[0].to_i
m = x[1].to_i
y = x[2].to_i
z = x[3].to_i
result = []

c_score = Hash.new()
c_num = Hash.new()
main_score =Array.new(n+1).map!{Array.new((1 << m)+ 1).map!{Array.new(m+1, -520000000)}}
num = 1

for i in 0..(m-1)
  a = gets().chomp.split(/\s/)
  c_score[a[0]] = a[1].to_i
  c_num[a[0]] = num
  num += 1
end

all = (1 << m)

main_score[0][0][0] = 0

#x = gets().chomp.split(//)
#x.each_with_index do |tmp, i|
x = gets
i = 0
while i < n
#p i
unless x[i]
x += gets
end
tmp = x[i]
# tmp = getchar
  b = c_num[tmp]
  for j in 0..all
    for k in 0..m
      if main_score[i][j][k] != -520000000
	tmp_point = main_score[i][j][k]
        gain = c_score[tmp]
	if k == b
	  gain += y.to_i
	end
	if k == 0
	  if (tmp_point + gain) >= main_score[i+1][1<<(b-1)][b]
	    main_score[i+1][1<<(b-1)][b] = tmp_point + gain
          end
	else
	  if (tmp_point + gain) >= main_score[i+1][j | 1 << (k-1)][b]
            main_score[i+1][j | 1<<(k-1)][b] = tmp_point + gain
	  end
	end
	if tmp_point >= main_score[i+1][j][k]
	  main_score[i+1][j][k] = tmp_point
	end
      end
    end
  end
  i += 1
end

max = 0

for j in 0..all
  for k in 0..m
    tmp = main_score[n][j][k]
    if j == all-1
      tmp += z
    end
    max = [tmp, max].max
  end
end
#p main_score[4000]
#p main_score[n][1][0], main_score[n][1][1]
p max
