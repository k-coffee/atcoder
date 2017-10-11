#!/usr/bin/ruby -Ku

$counter = 0

def rec(s, i)
  if i > $counter
    puts s
  else
    rec(s+"a", i+1)
    rec(s+"b", i+1)
    rec(s+"c", i+1)
  end
end

$counter = gets.to_i

rec("", 1)
