#!/usr/bin/ruby -Ku

x = gets()
x = gets().split(/\s/).map{|t| t.to_i}

hoge = Array.new()

x.each do |t|
  while t % 2 == 0
    t = t / 2
  end
  hoge << t
end

puts hoge.uniq.size
