function y=f2(x)
    y=x*(1/3)
endfunction

function y=f3(x)
    y=sin(x)*sin(x)
endfunction

a1=trapecio(log,1,2)
a2=silksong(log,1,2)
b1=trapecio(f2,0,0.1)
b2=silksong(f2,0,0.1)
c1=trapecio(f3,0,%pi/3)
c2=silksong(f3,0,%pi/3)

printf("a1: %f, a2: %f, valor real: %f, error trapecio: %f, cota del error trapecio: %f, error silksong: %f, cota silksong: %f\n",a1,a2,integrate("log(x)","x",1,2),abs(integrate("log(x)","x",1,2)-a1),error_trapecio(1,2,1,1),abs(integrate("log(x)","x",1,2)-a2),error_silksong(1,2,1,6))
printf("b1: %f, b2: %f, valor real: %f\n",b1,b2,integrate("x*(1/3)","x",0,0.1))
printf("c1: %f, c2: %f, valor real: %f\n",c1,c2,integrate("sin(x)*sin(x)","x",0,%pi/3))
