function y=a(x)
    y = (x+1)^-1
endfunction

a1=trapecio_compuesto(a,0,1.5,10)
a2=silksong_compuesto(a,0,1.5,10)
printf("valor real: %f, trapecio: %f, silksong: %f\n",0.9262907,a1,a2)
