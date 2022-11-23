T4 = chebyshev(4)

x = roots(T4)
y = %e.^x

pol = DD_Newton(x,y)

equis = -1:0.01:1

ely = (%e.^equis) - horner(pol,equis)

plot2d(equis,ely)
a=gca()
a.x_location = "origin"
a.y_location = "origin"
