#!/usr/bin/ruby -Ku

$x = gets().chomp.split(//)
$x_size = $x.size

$count = $x.select{|t| t == "M"}.size
$count /= 2
$max = 0
$dp = Hash.new{|k, v| k[v] = Hash.new(-100000)}

$dp[0][0] = 0

$x.each_with_index do |tmp, i|
  $dp[i].each do |pos, value|
    if tmp == "M"
      if $dp[i+1][pos+1] < value
        $dp[i+1][pos+1] = value
      end
      if $dp[i+1][pos-1] < value
        $dp[i+1][pos-1] = value
      end
    elsif tmp == "+"
      if $dp[i+1][pos] < (value + pos)
        $dp[i+1][pos] = value + pos
      end
    else
      if $dp[i+1][pos] < (value - pos)
        $dp[i+1][pos] = value - pos
      end
    end
  end
end

puts $dp[$x_size][0]
