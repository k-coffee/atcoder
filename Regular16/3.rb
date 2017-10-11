#!/usr/bin/ruby -Ku

x = gets().chomp.split(/\s/)
idol_num = x[0].to_i
slot_num = x[1].to_i
costs = Array.new(slot_num, 0)
idols = Array.new()
score = Array.new(1<<idol_num, 10000000)
score[0] = 0

for i in 1..slot_num
  x = gets().chomp.split(/\s/)
  idol = Array.new(x[0].to_i)
  costs[i] = x[1].to_i
  for j in 1..x[0].to_i
    tmp = gets().chomp.split(/\s/)
    idol[j-1] = [tmp[0].to_i - 1, tmp[1].to_i]
  end
  idols << idol
end

for i in 1..1<<idol_num
  idols.each_with_index do |slot, snum|
    tmp = 1 * costs[snum+1]
    pcount = 0.0;

    slot.each do |tmpidol|
      if (i & (1<<tmpidol[0])) != 0
        tmp = tmp + score[i ^ (1<<tmpidol[0])] * tmpidol[1] / 100.0
        pcount += tmpidol[1].to_f
      end
    end

    next if pcount == 0.0
    tmp = tmp * 100 / pcount
    if score[i] > tmp
      score[i] = tmp
    end
  end
end

puts score[(1<<idol_num) - 1]
