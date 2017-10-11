#!/usr/bin/ruby -Ku

x = {'A' => 0, 'B' => 0, 'C' => 0, 'D' => 0, 'E' => 0, 'F' => 0}
s = ""

tmp = gets.chomp.split(//)

tmp.each do |t|
  x[t] += 1
end

x.each_value do |v|
  s += "#{v} "
end
puts s.gsub(/\s$/, "\n")
