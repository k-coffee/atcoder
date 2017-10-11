#!/usr/bin/ruby -Ku

x = gets().chomp.split(//).sort
n = gets().to_i

first = n / x.size
second = (n % x.size) - 1

first -= 1 if second == -1

print "#{x[first]}#{x[second]}\n"
