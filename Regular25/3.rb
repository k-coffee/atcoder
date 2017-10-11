#!/usr/bin/ruby

x = gets().split(/\s/)
n = x[0].to_i
m = x[1].to_i
r = x[2].to_i
t = x[3].to_i

road = Array.new(n).map{|x| x = Array.new()}

for i in 1..m
  tmp = gets().split(/\s/)
  road[tmp[0].to_i-1] << [tmp[1].to_i-1, tmp[2].to_i]
  road[tmp[1].to_i-1] << [tmp[0].to_i-1, tmp[2].to_i]
end

ans = 0

for goal in 0..n-1
  bak = Array.new()
  new = Array.new(n, 99999999999999)
  for tt in 0..n-1
    next if tt == goal
    new[tt] = 0
    bak = Marshal.load(Marshal.dump(new))
    pos = Array.new()
    pos << tt
    while(1)
      newpos = Array.new()
      pos.each do |p|
        road[p].each do |go, cost|
	  if (bak[p] + cost) < bak[go]
            new[go] = bak[p]+cost
            newpos << go
          end
        end
      end
      pos = newpos.uniq
      bak = Marshal.load(Marshal.dump(new))
      if pos.size < 1
        break
      end
    end
    tscore = new.map{|x| x = x.to_f / t}

    for rr in 0..n-1
      if rr == goal || rr == tt
        next
      end
      new = Array.new(n, 9999999999999)
      new[rr] = 0
      bak = Marshal.load(Marshal.dump(new))
      pos = Array.new()
      pos << rr
      while(1)
        newpos = Array.new()
        pos.each do |p|
          road[p].each do |go, cost|
	    if (bak[p] + cost) < bak[go]
              new[go] = bak[p]+cost
              newpos << go
            end
          end
        end
        pos = newpos.uniq
        bak = Marshal.load(Marshal.dump(new))
        if pos.size < 1
          break
        end
      end
      rscore = new.map{|x| x = x.to_f / r}
if tt == 1 && rr == 2
puts "#{tscore[goal]}, #{rscore[goal]}"
puts "#{tt}, #{rr}, #{goal}"
end
      if (rscore[goal] > tscore[goal])
        ans += 1
puts "#{tscore[goal]}, #{rscore[goal]}"
puts "#{tt}, #{rr}, #{goal}"
      end
    end
  end
end


puts ans
