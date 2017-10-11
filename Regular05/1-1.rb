#!/usr/bin/ruby -Ku

list = ["TAKAHASHIKUN", "takahashikun", "Takahashikun"]
x = gets().chomp
y = gets().chomp
y = y.gsub(/\.$/, '').split(/\s/)

c = 0
y.each do |tmp|
	c += 1 if list.index(tmp)
end

puts c
