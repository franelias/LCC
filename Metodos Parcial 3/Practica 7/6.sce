x = poly([0 1],"x","c")
p = 2 + (x+1) * 1 + (x-1) * -2 + (x-2)*2

horner(p,0)
error_lagrange(0,[-1,1,2,4],33.6)
