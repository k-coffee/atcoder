#!/usr/bin/ruby

x = gets().split(/\s/)
c = Array.new()

for i in 0..x[0].to_i-1
  t = gets().split(/\s/).map{|a| a = a.to_i}.flatten
  c << t
end

max = 0

for tate in 0..x[0].to_i-1
  for yoko in 0..x[1].to_i-1
    for p in 0..x[0].to_i-1-tate
      for q in 0..x[1].to_i-1-yoko
        wtmp = 0
        btmp = 0
	for i in 0..tate
	  for j in 0..yoko
	    if (i+p) % 2 == 0
	      if (j+q) % 2 == 0
	    	btmp += c[i+p][j+q]
	      else
	    	wtmp += c[i+p][j+q]
	      end
	    else
	      if (j+q) % 2 == 0
	    	wtmp += c[i+p][j+q]
	      else
	    	btmp += c[i+p][j+q]
	      end
	    end
	  end
	end
    	max = (tate+1) * (yoko+1) if wtmp == btmp
      end
    end
  end
end

puts max
