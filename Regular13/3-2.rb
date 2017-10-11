#!/usr/bin/ruby -Ku

def cut_cand(tf, haba)
  ans = Array.new()
  x = [0, 1000000]
  y = [0, 1000000]
  z = [0, 1000000]
  haba.each do |h|
    if h[0] > x[0]
      x[0] = h[0]
    end
    if h[0] < x[1]
      x[1] = h[0]
    end
    if h[1] > y[0]
      y[0] = h[1]
    end
    if h[1] < y[1]
      y[1] = h[1]
    end
    if h[2] > z[0]
      z[0] = h[2]
    end
    if h[2] < z[1]
      z[1] = h[2]
    end
  end

  for i in 0..x[0]-1
    tmptf = [tf[0] - (i+1), tf[1], tf[2]]
    tmphaba = Array.new()
    haba.each do |h|
      tmphaba << [h[0]-(i+1), h[1], h[2]]
    end
    ans << [tmptf, tmphaba]
  end
  for i in x[1]+1..tf[0]-1
    tmptf = [i, tf[1], tf[2]]
    ans << [tmptf, haba]
  end
  for i in 0..y[0]-1
    tmptf = [tf[0], tf[1]-(i+1), tf[2]]
    tmphaba = Array.new()
    haba.each do |h|
      tmphaba << [h[0], h[1]-(i+1), h[2]]
    end
    ans << [tmptf, tmphaba]
  end
  for i in y[1]+1..tf[1]-1
    tmptf = [tf[0], i, tf[2]]
    ans << [tmptf, haba]
  end
  for i in 0..z[0]-1
    tmptf = [tf[0], tf[1], tf[2]-(i+1)]
    tmphaba = Array.new()
    haba.each do |h|
      tmphaba << [h[0], h[1], h[2]-(i+1)]
    end
    ans << [tmptf, tmphaba]
  end
  for i in z[1]+1..tf[2]-1
    tmptf = [tf[0], tf[1], i]
    ans << [tmptf, haba]
  end

  if ans.empty?
    return nil
  else
    return ans
  end
end

def toufu(tf, haba, player, num)
  cand = cut_cand(tf, haba)
  if cand
    results = Array.new()
    cand.each do |c|
      results << toufu(c[0], c[1], player+1, num+1)
    end
    if player % 2 == 0
      if results.index(true)
	return true
      else
	return false
      end
    else
      if results.index(false)
        return false
      else
        return true
      end
    end
  else
    if player % 2 == 0
      return true
    else
      return false
    end
  end
end

x = gets().chomp
n = x.to_i
win = 0
lose = 0
for i in 0..n-1
  tf = gets().chomp.split(/\s/).map{|x| x = x.to_i}
  m = gets().chomp.to_i
  haba = Array.new()
  for j in 0..m-1
    haba << gets().chomp.split(/\s/).map{|x| x = x.to_i}
  end
  ans = toufu(tf, haba, 0, 0)
  if ans
    win += 1
  else
    lose += 1
  end
end

p win, lose
