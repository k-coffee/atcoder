x = gets().chomp.split(/\s/)

a = [x[0].to_f, x[1].to_f]
b = [x[2].to_f, x[3].to_f]
c = [x[4].to_f, x[5].to_f]

aa = Math.sqrt((a[0] - b[0])**2 + (a[1] - b[1])**2)
bb = Math.sqrt((b[0] - c[0])**2 + (b[1] - c[1])**2)
cc = Math.sqrt((c[0] - a[0])**2 + (c[1] - a[1])**2)
s = (aa + bb + cc) / 2
value = Math.sqrt(s * (s - aa) * (s - bb) * (s - cc))
puts value
