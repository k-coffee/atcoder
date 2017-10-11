#!/usr/bin/ruby -Ku

def trans_dis(x)
  tmp = x.to_f / 60
  tmp = tmp.round(1)

  if tmp <= 0.2
    return 0
  elsif tmp <= 1.5
    return 1
  elsif tmp <= 3.3
    return 2
  elsif tmp <= 5.4
    return 3
  elsif tmp <= 7.9
    return 4
  elsif tmp <= 10.7
    return 5
  elsif tmp <= 13.8
    return 6
  elsif tmp <= 17.1
    return 7
  elsif tmp <= 20.7
    return 8
  elsif tmp <= 24.4
    return 9
  elsif tmp <= 28.4
    return 10
  elsif tmp <= 32.6
    return 11
  else
    return 12
  end
end

def trans_deg(x)
  if x < 112.5
    return "N"
  elsif x < 337.5
    return "NNE"
  elsif x < 562.5
    return "NE"
  elsif x < 787.5
    return "ENE"
  elsif x < 1012.5
    return "E"
  elsif x < 1237.5
    return "ESE"
  elsif x < 1462.5
    return "SE"
  elsif x < 1687.5
    return "SSE"
  elsif x < 1912.5
    return "S"
  elsif x < 2137.5
    return "SSW"
  elsif x < 2362.5
    return "SW"
  elsif x < 2587.5
    return "WSW"
  elsif x < 2812.5
    return "W"
  elsif x < 3037.5
    return "WNW"
  elsif x < 3262.5
    return "NW"
  elsif x < 3487.5
    return "NNW"
  else
    return "N"
  end
end

x = gets().chomp.split(/\s/)
deg = x[0].to_i
dis = x[1].to_i

if trans_dis(dis) == 0
  puts "C 0" 
else
  puts "#{trans_deg(deg)} #{trans_dis(dis)}"
end
