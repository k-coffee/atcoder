#!/usr/bin/ruby -Ku

ans = Array.new()
x = gets().to_i

for i in 0..x-1
  s, t = gets().split(/\s/).map{|t| t = t.to_i}

  tmplist = [[s, t]]
  while tmplist
    flag = true
    for j in 0..ans.size-1
      if ans[j][0] == tmplist[0] && ans[j][1] == tmplist[1]
        ans[j][2] += 1
        tmplist = nil
        flag = false
      else
        if ans[j][0] <= tmplist[0]
          if ans[j][1] >= tmplist[1]
            tmp = ans[j][2]
            ans[j][1] = 
          else
            
          end
        elsif ans[j][1] > tmplist[0]
        else
        end
      end
    end
    if flag
      ans << [tmplist[0], tmplist[1], 1]
      tmplist = nil
    end
  end
=begin
  for j in s..t
    ans[j] += 1
  end
=end
end

puts ans.max
