#!/usr/bin/ruby -Ku

y = {"Monday" => 5, "Tuesday" => 4, "Wednesday" => 3, "Thursday" => 2, "Friday" => 1}

x = gets().chomp

if y[x]
  puts y[x]
else
  puts 0
end
