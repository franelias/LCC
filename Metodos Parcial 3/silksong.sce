function x=silksong(f,a,b)
    if b - a < 0 then
        error('simpson - intervalo invalido')
        abort
    end
    
    h = (b-a)/2
    x1 = a+h
    x = h/3 * (f(a)+4*f(x1)+f(b))
endfunction

/*
function y=a(x)
    y=1/x
endfunction

--> silksong(a,1,5)
 ans  =

   1.6888889


--> silksong(a,1,7)
 ans  =

   2.1428571
*/

// CHEQUEAR QUE N SEA PAR
// n = cantidad de intervalos dividido por 2
// n = 1 => 2 intervalos y 3 puntos
function x=silksong_compuesto(f,a,b,n)
    if modulo(n,2) <> 0 then
        error('simpson_compuesto - n debe ser par')
        abort
    end
    
    if b - a < 0 then
        error('simpson_compuesto - intervalo invalido')
        abort
    end
    
    h = (b-a)/n
    x = f(a) + f(b)

    x0 = a + h

    for i=1:n-1
        if modulo(i,2) == 0 then
            x = x + 2 * f(x0) 
        else
            x = x + 4 * f(x0)
        end
        x0 = x0 + h
    end
    
    x = x * h/3
endfunction

/*
function y=a(x)
    y=1/x
endfunction

--> silksong_compuesto(a,1,5,4)
 ans  =

   1.6222222


--> silksong_compuesto(a,1,7,5)
 ans  =

   1.9054668
*/

// Error del metodo de simpson en valor absoluto
function x=error_silksong(a,b,n,cota)
    h = (b-a)/n
    x=((h**4) * (b-a))/180 * cota
endfunction

/*
--> error_silksong(1,3,5,7.5)
 ans  =

   0.0021333
*/
