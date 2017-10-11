#!/usr/bin/ruby -Ku

x = gets.split(/\s/).map{|t| t.to_i}
ans = Array.new()

x.combination(3) {|a, b, c|
  ans << a + b + c
}

puts ans.sort[-3]
