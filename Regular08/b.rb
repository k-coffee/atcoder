#!/usr/bin/ruby -Ku

num = 0.0
tmp = gets().chomp.split(/\s/)
n = tmp[0].to_i
m = tmp[1].to_i

name = gets().chomp.split(//)
kit = gets().chomp.split(//)

name_h = Hash.new(0)
kit_h = Hash.new(0)

name.each do |x|
  name_h[x] += 1
end

kit.each do |x|
  kit_h[x] += 1
end

name_h.each do |key, value|
  if kit_h[key] == 0
    puts -1
    exit(0)
  end

  tmp = value.to_f / kit_h[key].to_f
  if tmp > num
    num = tmp
  end
end

puts num.ceil
