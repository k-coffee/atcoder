#!/usr/bin/ruby -Ku

counter = 0
12.times do |t|
  x = gets.chomp
  counter += 1if x =~ /r/
end

puts counter
