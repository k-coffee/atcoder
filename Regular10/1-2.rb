#!/usr/bin/ruby -Ku

x = gets().chomp
x = x.to_i

rest = Array.new(367)
m = Array.new()
d = Array.new()

i = 0
while i <= (367 / 7 + 1)
  rest[i*7 + 1] = 1
  rest[i*7] = 1
  i += 1
end

for i in 0..(x-1)
  y = gets().chomp
  y = y.split(/\//)
  day = 0

  case y[0].to_i
  when 1
    day = 0
  when 2
    day = 31
  when 3
    day = 60
  when 4
    day = 91
  when 5
    day = 121
  when 6
    day = 152
  when 7
    day = 182
  when 8
    day = 213
  when 9
    day = 244
  when 10
    day = 274
  when 11
    day = 305
  when 12
    day = 335
  end

  day += y[1].to_i

  if rest[day] == 0
    rest[day] = 1
  else
    day += 1
    while day < 367
      if rest[day] == 0
        rest[day] = 1
        break
      end
      day += 1
    end
  end
end

max = 0
flag = true
counter = 0
for i in 0..367
  if rest[i] == 1
    counter += 1
  else
    if max < counter
      max = counter
    end
    counter = 0
  end
end

if max < counter
  max = counter
end
puts max
