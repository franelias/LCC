function r=poli_phi(n)
    vec = zeros(1,n)
    vec(n) = 1
    r = poly(vec,"x","c")
endfunction

/*
--> poli_phi(3)
 ans  =

    2
   x 
   
--> poli_phi(5)
 ans  =

    4
   x 
*/

// p =  grado del polinomio
function [r,err]=poli_minimos(X,y,p)
    A = 0
    m = length(X)
    for i=1:p+1
        phi = poli_phi(i)
        for j=1:m
            A(j,i) = horner(phi,X(j))
        end
    end
    
    disp(A)
    
    coef=gausselimPP(A'*A,A'*y')
    r = poly(coef,"x","c")
    err = A*coef-y'
endfunction

/*
x = [0 0.15 0.31 0.5 0.6 0.75]
y = [1 1.004 1.31 1.117 1.223 1.422]

--> [r,err]=poli_minimos(x,y,1)
 err  = 

  -0.0039334
   0.0634692
  -0.166368
   0.1170753
   0.0586771
  -0.0689203

// aprixmacion del error: norm(err,2)

 r  = 
                        
   0.9960666 +0.4760174x
*/

// Aproximación polinomial de mínimos cuadrados polinomial para matrices con rango completo
function [p,err] = MinCuad_pol(A,b)
    // Entrada: b = vectores 1xn
    // Salida: p = polinomio de mínimos cuadrados; err = vector de errores (eps = Ax-b)
     [w,a] = gausselimPP((A')*A,(A')*(b'))
     p = poly(w,"x","coeff")
     err = A*w-b'
endfunction

/*
x = [0 0.15 0.31 0.5 0.6 0.75]
y = [1 1.004 1.31 1.117 1.223 1.422]
a = A_mc(x,5)

--> MinCuad_pol(A,y)
 ans  =
                            2            3            4            5
   1 -8.1503327x +95.561802x  -342.02435x  +493.03276x  -248.31321x 
*/

// Matriz del método de mínimo cuadrados polinomial
function A = A_mc(x,n)
    // Entrada: x,y = vectores 1xn; n = grado de la aproximación
    // Salida: A = matriz del método de mínimo cuadrados
    m = length(x)
    A = ones(m,1)
    for j=2:(n+1) do
        A = [A,(x').^(j-1)]
    end
endfunction

/*
x = [0 0.15 0.31 0.5 0.6 0.75]

--> A_mc(x,5)
 ans  =
   1.   0.     0.       0.         0.          0.       
   1.   0.15   0.0225   0.003375   0.0005062   0.0000759
   1.   0.31   0.0961   0.029791   0.0092352   0.0028629
   1.   0.5    0.25     0.125      0.0625      0.03125  
   1.   0.6    0.36     0.216      0.1296      0.07776  
   1.   0.75   0.5625   0.421875   0.3164062   0.2373047
*/
