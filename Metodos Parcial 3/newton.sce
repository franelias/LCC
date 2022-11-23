// Diferencias divididas pero el parametro es una funcion
function r = DD2(f,x)
    n = length(x)
    if n == 2 then
        r  = (f(x(2) - f(1))) / (x(2) - x(1))
        return
    end
    
    r = (DD(x(2:n)) - DD(1:n-1)) / (x(n) - x(1))
endfunction

/*
x = [2 2.1 2.2 2.3 2.4 2.5]

--> DD2(cos,x)
 ans  =

   0.3333
*/

// Diferencias divididas pero el parametro es un array con los y ya calculados
function w = DD(x,y)
    n = length(x)
    if n==2 then
        w = (y(n)-y(1))/(x(n)-x(1))
    else
        w = (DD(x(2:n),y(2:n))-DD(x(1:n-1),y(1:n-1)))/(x(n)-x(1))
    end
endfunction

/*
x = [0 0.2 0.4 0.6]
y = [1.0 1.2214 1.4918 1.8221]

--> DD(x,y)
 ans  =

   0.2270833
   
*/

// Retorna el polinomio de interpolacion evaluado en el punto p
function w = interpolacion_newton(p,x,y)
    w = 0
    n = length(x)
    for j=n:-1:2
        w = (w + DD(x(1:j),y(1:j)))*(p-x(j-1))
    end
    w = w + y(1)
endfunction

/*
x = [0 0.2 0.4 0.6]
y = [1.0 1.2214 1.4918 1.8221]

--> interpolacion_newton(1/3,x,y)
 ans  =

   1.3955494
   
x = [2 2.1 2.2 2.3 2.4 2.5]
y = [0.2239 0.1666 0.1104 0.0555 0.0025 -0.0484]

--> interpolacion_newton(1/3,x,y)
 ans  =

   17.852126
*/

// Método de Diferencias Divididas de Newton
// Retorna el polinomio de interpolacion
function w = DD_Newton(x,y)
    // Entrada: x,y = vectores puntos de interpolación (x,y)
    // Salida: w = polinomio de diferencias divididas de Newton
    w = 0
    s = poly(0,"x")
    n = length(x)
    for j=n:-1:2
        w = w*(s-x(j-1)) + DD(x(1:j),y(1:j))*(s-x(j-1))
    end
    w = w + y(1)
endfunction

/*
x = [0 0.2 0.4 0.6]
y = [1.0 1.2214 1.4918 1.8221]

--> DD_Newton(x,y)
 ans  =
                          2            3
   1 +1.0026667x +0.47625x  +0.2270833x 
   
x = [2 2.1 2.2 2.3 2.4 2.5]
y = [0.2239 0.1666 0.1104 0.0555 0.0025 -0.0484]

--> DD_Newton(x,y)
 ans  =
                            2            3      4            5
   38.8381 -84.5671x +75.23x  -33.633333x  +7.5x  -0.6666667x 
*/
