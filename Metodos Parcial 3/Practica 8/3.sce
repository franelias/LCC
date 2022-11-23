function y=a(x)
    y=1/x
endfunction

function y=b(x)
    y=x^3
endfunction

function y=c(x)
    y=x*(1+x^2)^(1/2)
endfunction

function y=d(x)
    y=sin(%pi*x)
endfunction

function y=d(x)
    y=sin(%pi*x)
endfunction

function y=e(x)
    y=x*sin(x)
endfunction

function y=f(x)
    y=x^2 * %e^x
endfunction

printf("a) valor real: %f, silksong compuesto: %f\n",integrate("1/x","x",1,3),silksong_compuesto(a,1,3,4))
printf("b) valor real: %f, silksong compuesto: %f\n",integrate("x^3","x",0,2),silksong_compuesto(b,0,2,4))
printf("c) valor real: %f, silksong compuesto: %f\n",integrate("x*(1+x^2)^(1/2)","x",0,3),silksong_compuesto(c,0,3,6))
printf("d) valor real: %f, silksong compuesto: %f\n",integrate("sin(%pi*x)","x",0,1),silksong_compuesto(d,0,1,8))
printf("e) valor real: %f, silksong compuesto: %f\n",integrate("x*sin(x)","x",0,2*%pi),silksong_compuesto(e,0,2*%pi,8))
printf("f) valor real: %f, silksong compuesto: %f\n",integrate("x^2 * %e^x","x",0,1),silksong_compuesto(f,0,1,8))
