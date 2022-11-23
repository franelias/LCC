x = [4 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8 7.1]
y = [102.56 113.18 130.11 142.05 167.53 195.14 224.87 256.73 299.5 326.72]
a=poli_minimos(x,y,1)
b=poli_minimos(x,y,2)
c=poli_minimos(x,y,3)

equis = 4:0.01:7.1
y1 = horner(a,equis)
y2 = horner(b,equis)
y3 = horner(c,equis)

plot2d(equis,[y1' y2' y3'],[1 2 3])
plot2d(x,y,-1)

