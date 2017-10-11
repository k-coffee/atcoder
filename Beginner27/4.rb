#!/usr/bin/ruby -Ku

$x = gets().split(//)
$x_size = $x.size

$count = $x.select{|t| t == "M"}.size
$count /= 2
$max = 0


def rec(p_count, m_count, point, now, num)
  if num >= $x_size
    if $max < point
      $max = point
    end
  else
    if $x[num] == "M"
      if p_count < $count
        rec(p_count+1, m_count, point, now+1, num+1)
      end
      if m_count < $count
        rec(p_count, m_count+1, point, now-1, num+1)
      end
    else
      if $x[num] == "+"
        rec(p_count, m_count, point + now, now, num+1)
      else
        rec(p_count, m_count, point - now, now, num+1)
      end
    end
  end
end

rec(0, 0, 0, 0, 0)

puts $max
