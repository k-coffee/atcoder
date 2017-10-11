#!/usr/bin/ruby -Ku

x = gets().split(//)
count = 0
bak = ""

x.each do |t|
  if t == bak
    count += 1
  else
    unless count < 1
      print bak, count
      count = 1
      bak = t
    else
      count += 1
      bak = t
    end
  end
end

puts ""
