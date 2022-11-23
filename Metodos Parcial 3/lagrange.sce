// Funcion L del Método de Lagrange
// p es el punto, x el vector de nodos, k es el indice de L
function r=L(p,x,k)
    n = length(x)
    r = 1
    for i=1:n
        if i <> k
            r = r * (p-x(i))/(x(k) - x(i))
        end
    end
endfunction

/*
x = [0 0.2 0.4 0.6]

--> L(5,x,3)
 ans  =

  -6600.

--> L(2,x,2)
 ans  =

   280.
*/

function r=lagrange(p,x,y)
    n = length(x)
    r = 0
    for i = 1:n
        r = r + L(p,x,i) * y(i)
    end
endfunction

/*
--> lagrange(1/3,x,y)
 ans  =

   1.3955494
   
--> f = poly([0],"x")
 f  = 
   x

// SACA EL POLINOMIO DE LAGRANGE

--> lagrange(f,x,y)
 ans  =

                          2            3
   1 +1.0026667x +0.47625x  +0.2270833x 
*/

// ESTA EN VALOR ABSOLUTO
function e=error_interpolacion_evaluado(p,x,cota)
    n = length(x)
    e = 1
    for i=1:n
        e = e*abs(p-x(i))
    end
    e = e * cota/factorial(n)
endfunction

/*
--> error_interpolacion_evaluado(5,x,5.6)
 ans  =

   113.344

--> error_interpolacion_evaluado(12,x,5.6)
 ans  =

   4369.2096
*/

function e=error_interpolacion(x,cota)
    equis = poly([0 1],"x","c")
    n = length(x)
    e = 1
    for i=1:n
        e = e*(equis - x(i))
    end
    e = e * cota/factorial(n)
endfunction

