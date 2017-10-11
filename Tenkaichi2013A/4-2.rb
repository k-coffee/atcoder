#!/usr/bin/ruby -Ku

x = gets().chomp.split(/\s/)

b = x[0].to_i
l = x[1].to_i
n = x[2].to_i

y = gets().chomp

yy = y.split(//)
kakko = 0
toji = false
alla = ""
allz = ""
tmp = Array.new()
tmp[0] = ""
for i in 0..yy.size-1
  c = yy[i]
  if kakko == 0 && c != "("
    if toji
      if c =~ /\d/
        num = c.to_i
        for j in 1..(yy.size-1-i)
          if yy[i+j] =~ /\d/
	    num *= 10
	    num += yy[i+j].to_i
          else
	    i += j - 1
	    break
          end
        end
        t = tmp[1] * num
	tmp[1] = ""
        allz += t
      else
        allz += tmp[1]
        allz += c
      end
    else
      alla += c
    end
    next
  end
  if c == "("
    kakko += 1
    tmp[kakko] = ""
    next
  end
  if c == ")"
p tmp
    tmp[kakko-1] += tmp[kakko]
    kakko -= 1
    toji = true
    next
  end

  if c =~ /\d/
    num = c.to_i
    for j in 1..(yy.size-1-i)
      if yy[i+j] =~ /\d/
	num *= 10
	num += yy[i+j].to_i
      else
	i += j - 1
	break
      end
    end
    s1 = tmp[kakko].size
    s2 = tmp[kakko+1].size
    tmp[kakko][s1-s2, s2] = ""
    tmp[kakko] += tmp[kakko+1] * num
    tmp[kakko+1] = ""
  else
    tmp[kakko] += c
  end
end

all = alla + allz
puts all
puts all[b, l]
