#!/usr/bin/ruby -Ku

xx = gets().chomp.to_i
times = Array.new()

for i in 1..xx
  tmp = gets().chomp.split(/-/)
  s = tmp[0]
  e = tmp[1]
  tmps = s[3].to_i
  if tmps < 5
    tmps = 0
  else
    tmps = 5
  end
  tmpe = e[3].to_i
  if tmpe == 0
    tmpe = 0
  elsif tmpe <= 5
    tmpe = 5
  else
    tmpe = 10
  end
  s_m = (s[0..1].to_i * 60 + s[2].to_i * 10 + tmps)
  e_m = (e[0..1].to_i * 60 + e[2].to_i * 10 + tmpe)
  times << [s_m, e_m]
end

i = 0
while i < times.size
  flag = true
  while flag
    flag = false
    j = times.size-1
    while j > i
      if times[i][0] <= times[j][0] && times[i][1] >= times[j][1]
        times.delete_at(j)
      elsif (times[j][1] - times[i][0]) == 5 || (times[j][1] - times[i][0]) == 0
        times[i][0] = times[j][0]
        times.delete_at(j)
        flag = true
      elsif (times[i][1] - times[j][0]) == 5 || (times[i][1] - times[j][0]) == 0
        times[i][1] = times[j][1]
        times.delete_at(j)
        flag = true
      elsif times[i][0] < times[j][0] && times[i][1] > times[j][0]
        times[i][1] = times[j][1]
        times.delete_at(j)
        flag = true
      elsif times[j][0] < times[i][0] && times[j][1] > times[i][0]
        times[i][0] = times[j][0]
        times.delete_at(j)
        flag = true
      end
      j -= 1
    end
  end
  i += 1
end

times.sort!{|a, b| a[0] <=> b[0]}

times.each do |x|
  s_h = x[0] / 60
  s_m = x[0] % 60
  e_h = x[1] / 60
  e_m = x[1] % 60

  if e_h >= 24
    e_h = 25
    e_m = 0
  end

  printf("%02d", s_h)
  printf("%02d", s_m)
  print "-"
  printf("%02d", e_h)
  printf("%02d", e_m)
  puts 
end
