#!/usr/bin/ruby -Ku

n = gets().to_i
$shain = Array.new(n).map{|t| t = Array.new()}

def rec(num)
  ans = Array.new()

  if $shain[num].empty?
    return 1
  end

  $shain[num].each do |n|
    ans << rec(n)
  end
  return (ans.max + ans.min) + 1
end


for i in 1..n-1
  x = gets().to_i
  $shain[x-1] << i
end

puts rec(0)
