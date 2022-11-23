function w=cambio_variable(g,a,b)
    deff("y=f(x)","y=g(("+string(b+a)+"+x*"+string(b-a)+")/2)")
    t4=chebyshev(4)
    
    x = roots(t4)
    
    for i=1:length(x)
        x(i) = ((b+a)+x(i)*(b-a))/2
        y(i) = g(x(i))
    end

    w = DD_Newton(x,y)

    equis = 0:0.01:%pi/2
    
    y1 = horner(w,equis)
    y2 = cos(equis)
  
    plot2d(equis,[y1' y2'],[1 2],leg="poli@real")
    plot2d(x,y',-1)
endfunction

w=cambio_variable(cos,0,%pi/2)
