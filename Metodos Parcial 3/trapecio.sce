function x=trapecio(f,a,b)
    h = b-a
    x = (f(a) + f(b)) * h/2
endfunction

/*
function y=a(x)
    y=1/x
endfunction

--> trapecio(a,1,5)
 ans  =

   2.4


--> trapecio(a,1,7)
 ans  =

   3.4285714
*/


// Tn, n = cantidad de veces que se aplica el metodo del trapecio (e intervalos))
function x=trapecio_compuesto(f,a,b,n)
    if b - a < 0 then
        error('trapecio_compuesto - intervalo invalido')
        abort
    end
    
    h = (b-a)/n
    x = 1/2 * f(a) + 1/2 * f(b)
    
    x0 = a + h
    
    for i=1:n-1
        x = x + f(x0)
        x0 = x0 + h
    end
    
    x = h * x
endfunction

/*
function y=a(x)
    y=1/x
endfunction

--> trapecio_compuesto(a,1,5,4)
 ans  =

   1.6833333


--> trapecio_compuesto(a,1,7,5)
 ans  =

   2.0518761
*/

// Error del trapecio en valor absoluto
function x=error_trapecio(a,b,n,cota)
    x=((b-a)**3)/(n**2 * 12) * cota
endfunction

/*
--> error_trapecio(1,3,5,7.5)
 ans  =

   0.2
*/
