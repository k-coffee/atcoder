#!/usr/bin/ruby -Ku

choku = ['ch', 'o', 'k', 'u']

x = gets().chomp

choku.each do |c|
  x.gsub!(/#{c}/, '')
end

if x.size == 0
  puts "YES"
else
  puts "NO"
end
