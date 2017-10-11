#!/usr/bin/ruby -Ku

def tate(color, orig)
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
	      for l in 0..counter
		ban[k-l-1][j] = "."
	      end
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
	  for l in 0..counter
	    ban[k-l][j] = "."
	  end
	end
      end
    end
  end

  return [win, maxlength]
end

def yoko(color, orig)
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
	      for l in 0..counter
		ban[i][k-l-1] = "."
	      end
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
	  for l in 0..counter
	    ban[i][k-l] = "."
	  end
	end
      end
    end
  end

  return [win, maxlength]
end

def naname1(color, orig)
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
	      for l in 0..counter-1
		ban[i+l][j+l] = "."
	      end
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
	  for l in 0..counter-1
	    ban[i+l][j+l] = "."
	  end
	end
      end
    end
  end

  return [win, maxlength]
end

def naname2(color, orig)
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
	      for l in 0..counter-1
		ban[i+l][j-l] = "."
	      end
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
	  for l in 0..counter-1
	    ban[i+l][j-l] = "."
	  end
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

info = tate("o", ban)
win += info[0]
bwin += info[0]
blength = info[1] if blength < info[1]
info = tate("x", ban)
win += info[0]
wwin += info[0]
wlength = info[1] if wlength < info[1]
info = yoko("o", ban)
win += info[0]
bwin += info[0]
blength = info[1] if blength < info[1]
info = yoko("x", ban)
win += info[0]
wwin += info[0]
wlength = info[1] if wlength < info[1]
info = naname1("o", ban)
win += info[0]
bwin += info[0]
blength = info[1] if blength < info[1]
info = naname1("x", ban)
win += info[0]
wwin += info[0]
wlength = info[1] if wlength < info[1]
info = naname2("o", ban)
win += info[0]
bwin += info[0]
blength = info[1] if blength < info[1]
info = naname2("x", ban)
win += info[0]
wwin += info[0]
wlength = info[1] if wlength < info[1]

for i in 0..18
  for j in 0..18
    bnum += 1 if ban[i][j] == "x"
    wnum += 1 if ban[i][j] == "o"
  end
end


flag = false
flag = true if win >= 2
flag = true if blength >= 10 || wlength >= 10
if bwin >= 1
  if bnum != wnum+1
    flag = true
  end
end
if wwin >= 1
  if bnum != wnum
    flag = true
  end
end

if bnum-wnum == 1 || bnum-wnum == 0
else
  flag = true
end

if flag
  puts "NO"
else
  puts "YES"
end
