deff("y=f(x)","y=1/(1+x^2)")

//ns = [2 4 6 10 14]

ns = [2 4 6 10 14]

for i=1:length(ns)
    n = ns(i)
    a = -5
    b= 5
    
    h = (b-a)/n
    
    x = -5:h:5
    y = 1./(1.+x.^2)  

    pol = DD_Newton(x,y)

    equis = -5:0.01:5
    ely = 1./(1.+equis.^2) - horner(pol,equis)

    plot2d(equis,ely)
    a=gca()
    a.x_location = "origin"
    a.y_location = "origin"
end
