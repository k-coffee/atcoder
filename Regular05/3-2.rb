#!/usr/bin/ruby -Ku

list = Array.new()

def tate(color, orig, list)
  ban = Marshal.load(Marshal.dump(orig))
  win = 0
  maxlength = 0
  for i in 0..18-4
    for j in 0..18
      if ban[i][j] == color
	counter = 1
	flag = false
	for k in i+1..18
	  if ban[k][j] != color
	    if flag
	      win += 1
	      tmplist = Array.new()
	      for l in 0..counter
		tmplist << [k-l-1, j]
		ban[k-l-1][j] = "."
	      end
	      list << tmplist
	    end
	    flag = false
	    break
	  else
	    counter += 1
	    if counter >= 5
	      flag = true
	      if maxlength <= counter
		maxlength = counter
	      end
	    end
	  end
	end
	if flag
	  win += 1
	  tmplist = Array.new()
	  for l in 0..counter
	    tmplist << [k-l, j]
	    ban[k-l][j] = "."
	  end
	  list << tmplist
	end
      end
    end
  end

  return [win, maxlength]
end

def yoko(color, orig, list)
  ban = Marshal.load(Marshal.dump(orig))
  win = 0
  maxlength = 0
  for i in 0..18
    for j in 0..18-4
      if ban[i][j] == color
	counter = 1
	flag = false
	for k in j+1..18
	  if ban[i][k] != color
	    if flag
	      win += 1
	      tmplist = Array.new()
	      for l in 0..counter
		tmplist << [i, k-l-1]
		ban[i][k-l-1] = "."
	      end
	      list << tmplist
	    end
	    flag = false
	    break
	  else
	    counter += 1
	    if counter >= 5
	      flag = true
	      if maxlength <= counter
		maxlength = counter
	      end
	    end
	  end
	end
	if flag
	  win += 1
	  tmplist = Array.new()
	  for l in 0..counter
	    tmplist << [i, k-l]
	    ban[i][k-l] = "."
	  end
	  list << tmplist
	end
      end
    end
  end

  return [win, maxlength]
end

def naname1(color, orig, list)
  ban = Marshal.load(Marshal.dump(orig))
  win = 0
  maxlength = 0
  for i in 0..18-4
    for j in 0..18-4
      if ban[i][j] == color
	counter = 1
	flag = false
	tmp = [i, j].max
	for k in 1..18-tmp
	  if ban[i+k][j+k] != color
	    if flag
	      win += 1
	      tmplist = Array.new()
	      for l in 0..counter-1
		tmplist << [i+l, j+l]
		ban[i+l][j+l] = "."
	      end
	      list << tmplist
	    end
	    flag = false
	    break
	  else
	    counter += 1
	    if counter >= 5
	      flag = true
	      if maxlength <= counter
		maxlength = counter
	      end
	    end
	  end
	end
	if flag
	  win += 1
	  tmplist = Array.new()
	  for l in 0..counter-1
	    tmplist << [i+l, j+l]
	    ban[i+l][j+l] = "."
	  end
	  list << tmplist
	end
      end
    end
  end

  return [win, maxlength]
end

def naname2(color, orig, list)
  ban = Marshal.load(Marshal.dump(orig))
  win = 0
  maxlength = 0
  for i in 0..18
    for j in 0..18
      if ban[i][j] == color
	counter = 1
	flag = false
	for k in 1..18
	  break if i+k > 18 || j-k < 0
	  if ban[i+k][j-k] != color
	    if flag
	      win += 1
	      tmplist = Array.new()
	      for l in 0..counter-1
		tmplist << [i+l, j-l]
		ban[i+l][j-l] = "."
	      end
	      list << tmplist
	    end
	    flag = false
	    break
	  else
	    counter += 1
	    if counter >= 5
	      flag = true
	      if maxlength <= counter
		maxlength = counter
	      end
	    end
	  end
	end
	if flag
	  win += 1
	  tmplist = Array.new()
	  for l in 0..counter-1
	    tmplist << [i+l, j-l]
	    ban[i+l][j-l] = "."
	  end
	  list << tmplist
	end
      end
    end
  end

  return [win, maxlength]
end

ban = Array.new()
for i in 0..18
  x = gets().chomp.split(//)
  ban << x
end

win = 0
bwin = 0
wwin = 0
bnum = 0
wnum = 0
blength = 0
wlength = 0

info = tate("o", ban, list)
win += info[0]
bwin += info[0]
blength = info[1] if blength < info[1]
info = tate("x", ban, list)
win += info[0]
wwin += info[0]
wlength = info[1] if wlength < info[1]
info = yoko("o", ban, list)
win += info[0]
bwin += info[0]
blength = info[1] if blength < info[1]
info = yoko("x", ban, list)
win += info[0]
wwin += info[0]
wlength = info[1] if wlength < info[1]
info = naname1("o", ban, list)
win += info[0]
bwin += info[0]
blength = info[1] if blength < info[1]
info = naname1("x", ban, list)
win += info[0]
wwin += info[0]
wlength = info[1] if wlength < info[1]
info = naname2("o", ban, list)
win += info[0]
bwin += info[0]
blength = info[1] if blength < info[1]
info = naname2("x", ban, list)
win += info[0]
wwin += info[0]
wlength = info[1] if wlength < info[1]

for i in 0..18
  for j in 0..18
    bnum += 1 if ban[i][j] == "o"
    wnum += 1 if ban[i][j] == "x"
  end
end

flag = false

if win == 1
  if bwin == 1
    if blength < 10 && bnum-wnum == 1
      flag = true
    end
  else
    if wlength < 10 && bnum-wnum == 0
      flag = true
    end
  end
elsif win == 0
  if bnum-wnum == 1 || bnum-wnum == 0
    flag = true
  end
end

if win > 1
  same = Array.new()
  for i in 1..win-1
    tmpsame = list[0] & list[i]
    if tmpsame.nil? || tmpsame.empty?
      flag = false
      break
    else
      tmpsame = tmpsame[0]
    end
    same = tmpsame if same.empty?
    if same != tmpsame
      flag = false
      break
    end

    if list[0].index(same) >= 5 && list[0].index(same) <= list[0].size-5
      flag = false
      break
    end
#    puts list[i].index(same), list[i].index(same)
    if list[i].index(same) >= 5 && list[i].index(same) <= list[i].size-5
      flag = false
      break
    end

    flag = true
  end
end

if flag && win > 1
  if bwin > 0
    if bnum-wnum != 1
      flag = false
    end
  else
    if bnum-wnum != 0
      flag = false
    end
  end
end

if flag
  puts "YES"
else
  puts "NO"
end
