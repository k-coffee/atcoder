#!/usr/bin/ruby -Ku

x = gets().chomp.to_f

if x < 100
  puts "00"
elsif x <= 5000
  if x < 1000
    puts "0#{(x/100).to_i}"
  else
    puts (x/100).to_i
  end
elsif x <= 30000
  puts (x/1000 + 50).to_i
elsif x <= 70000
  puts ((x/1000 - 30) / 5 + 80).to_i
else
  puts "89"
end
