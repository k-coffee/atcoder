#!/usr/bin/ruby -Ku

=begin
def rec(x, a, b)
  
end
=end

a = Hash.new(0)
b = Hash.new(0)
x = Hash.new(0)
tmpand = Hash.new(0)

gets().chomp.split(//).map{|t| a[t] += 1}
gets().chomp.split(//).map{|t| b[t] += 1}
gets().chomp.split(//).map{|t| x[t] += 1}

n = a.size

a.each do |k, v|
  if b[k] != 0
    if v < b[k]
      tmpand[k] = v
    else
      tmpand[k] = b[k]
    end
  end
end

tmpand.each do |k, v|
=begin
  a[k] -= v
  b[k] -= v
=end
#  aa = a[k]
#  bb = b[k]

  if x[k] > 0
    if x[k] < v
      x[k] = 0
  a[k] -= v
  b[k] -= v
    else
#      x[k] -= v
    end
  end
end

=begin
tmpx = Marshal.load(Marshal.dump(x))

tmpx.each do |k, v|
  if tmpand[k] > 0
    
  end
end
=end

countera = 0
counterb = 0

x.each do |k, v|
  if a[k] >= v
    countera += v
  end
  elsif b[k] >= v
    counterb += v
  else
    puts "NO"
    puts k, v
    exit(0)
  end
end

if countera > n / 2 || counterb > n / 2
  puts "NO"
else
  puts "YES"
end

# p tmpand
